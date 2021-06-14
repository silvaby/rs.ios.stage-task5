import UIKit

class MessageDecryptor: NSObject {
    func decryptMessage(_ message: String) -> String {
        guard message.count >= 1, message.count <= 60 else { return "" }

        var count = [String]()
        var word = [String]()
        var number = ""
        var result = ""

        for item in message {
            switch item {
            case "[":
                if number == "" {
                    count.append("1")
                } else {
                    count.append(number)
                }
                number = ""
                word.append(result)
                result = ""

            case "]":
                var temp = ""
                if let counts = Int(count.popLast() ?? "1") {
                    for _ in 0 ..< counts {
                        temp += result
                    }
                }
                result = word.popLast()! + temp

            case item where item.isNumber:
                number = "\(number)\(item)"

            case item where item.isLetter:
                result += String(item)

            default:
                break
            }
        }

        return result
    }
}
