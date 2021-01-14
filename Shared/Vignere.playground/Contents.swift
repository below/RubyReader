import Foundation

let input = "Mich" // juckt's"
let key = "fliege"

let uInput = input.unicodeScalars

let a = "R".uppercased()
let b = "f".uppercased()

let s = UnicodeScalar(a)

extension String.Element {
    func normalized() -> UInt32 {
        guard var result = UnicodeScalar(self.uppercased())?.value else {
            return 0
        }
        result -= UnicodeScalar("A").value
        return result
    }
}

extension Unicode.Scalar {
    var vignereNormalized: UInt32 {
        return self.value - UnicodeScalar("A").value
    }
}

Character("A").normalized()

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

addMod(Character("M"), Character("F"))
addMod(Character("i"), Character("l"))
addMod(Character("c"), Character("i"))
addMod(Character("h"), Character("e"))
addMod(Character("j"), Character("e"))
addMod(Character("u"), Character("F")) // X
addMod(Character("c"), Character("l"))
addMod(Character("k"), Character("i"))
addMod(Character("t"), Character("e"))
addMod(Character("s"), Character("e"))


var keyIterator = key.uppercased().unicodeScalars.makeIterator()

var output: String = ""
for char in input.unicodeScalars {
    let keyChar = keyIterator.next()!.vignereNormalized
    let result = char.vignereNormalized + keyChar % UnicodeScalar("Z").vignereNormalized
    if let scalar = UnicodeScalar(result + UnicodeScalar("A").value) {
        output += String(scalar)
    }
}

print (output)
