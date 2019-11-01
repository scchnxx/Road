import Foundation
import CommonCrypto

fileprivate enum CryptoAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    var HMACAlgorithm: CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .MD5:    result = kCCHmacAlgMD5
        case .SHA1:   result = kCCHmacAlgSHA1
        case .SHA224: result = kCCHmacAlgSHA224
        case .SHA256: result = kCCHmacAlgSHA256
        case .SHA384: result = kCCHmacAlgSHA384
        case .SHA512: result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }
    
    var digestLength: Int {
        var result: Int32 = 0
        switch self {
        case .MD5:    result = CC_MD5_DIGEST_LENGTH
        case .SHA1:   result = CC_SHA1_DIGEST_LENGTH
        case .SHA224: result = CC_SHA224_DIGEST_LENGTH
        case .SHA256: result = CC_SHA256_DIGEST_LENGTH
        case .SHA384: result = CC_SHA384_DIGEST_LENGTH
        case .SHA512: result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}

extension String {
    
    fileprivate func hmac(algorithm: CryptoAlgorithm, key: String) -> String {
        let cKey      = key.cString(using: String.Encoding.utf8)
        let cData     = cString(using: String.Encoding.utf8)
        let digestLen = algorithm.digestLength
        var result    = [CUnsignedChar](repeating: 0, count: digestLen)
        
        CCHmac(algorithm.HMACAlgorithm, cKey!, strlen(cKey!), cData!, strlen(cData!), &result)
        
        let hmacData   = Data(bytes: result, count: digestLen)
        let hmacBase64 = hmacData.base64EncodedString(options: .lineLength64Characters)
        
        return String(hmacBase64)
    }
}

fileprivate func dateString(from date: Date) -> String {
    let dateFormater        = DateFormatter()
    dateFormater.dateFormat = "EEE, dd MMM yyyy HH:mm:ww zzz"
    dateFormater.locale     = Locale(identifier: "en_US")
    dateFormater.timeZone   = TimeZone(secondsFromGMT: 0)
    return dateFormater.string(from: date)
}

struct Auth {
    var xdate: String
    var authorization: String
    
    static func gen(appID: String, appKey: String) -> Auth {
        let xdate         = dateString(from: Date())
        let signDate      = "x-date: \(xdate)"
        let base64HmacStr = signDate.hmac(algorithm: .SHA1, key: appKey)
        let authorization = #"hmac username="\#(appID)", algorithm="hmac-sha1", headers="x-date", signature="\#(base64HmacStr)""#
        
        return Auth(xdate: xdate, authorization: authorization)
    }
}
