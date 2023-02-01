import UIKit

//MARK: - String Literal

let someString = "Some string literal value"
print("==== SomeString ====")
print(someString)

//MARK: Multiline String Literals

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print("==== Quotation ====")
print(quotation)

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
print("==== SingleLineString & MultilineString ====")
print(singleLineString)
print(multilineString)

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
print("==== Soft Wrapped Quotation ====")
print(softWrappedQuotation)

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
print("==== Line Breaks ====")
print(lineBreaks)
