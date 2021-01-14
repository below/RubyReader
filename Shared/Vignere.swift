//
//  Vignere.swift
//  RubyReader
//
//  Created by Alexander v. Below on 13.01.21.
//

import Foundation

extension Unicode.Scalar {
    var vignereNormalized: UInt32 {
        return self.value - UnicodeScalar("A").value
    }
}

extension String.Element {
    func normalized() -> UInt32 {
        guard var result = UnicodeScalar(self.uppercased())?.value else {
            return 0
        }
        result -= UnicodeScalar("A").value
        return result
    }
}

struct Vignere {
    var key: String

    func encrypt(_ input: String) -> String {
        return ""
    }

    func decrypt(_ input: String) -> String {
        return ""
    }

    func addMod(_ text: Character, _ cipher: Character) -> Character {

        let a = text.normalized()
        let b = cipher.normalized()

        let modValue = Character("z").normalized()

        var sum = (a + b) % modValue
        sum += UnicodeScalar("A").value
        guard let result = UnicodeScalar(sum) else {
            return text
        }
        return Character(result)
    }

}
