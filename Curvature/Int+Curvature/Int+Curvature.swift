// Int+Curvature.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Zewo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

extension Int {
    public init?(hexString: String) {
        struct Error: ErrorType {}

        let map = [
            "0": 0,  "1": 1,  "2": 2,  "3": 3,
            "4": 4,  "5": 5,  "6": 6,  "7": 7,
            "8": 8,  "9": 9,  "A": 10, "B": 11,
            "C": 12, "D": 13, "E": 14, "F": 15
        ]

        let number = try? hexString.uppercaseString.unicodeScalars.reduce(0) {
            let digitCharacter = String($1)
            guard let digit = map[digitCharacter] else { throw Error() }
            return $0 * 16 + digit
        }

        if let number = number {
            self.init(number)
        } else {
            return nil
        }
    }
}