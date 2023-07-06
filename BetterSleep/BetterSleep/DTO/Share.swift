/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Share : Codable {
	let subject : String?
	let text : String?
	let href : String?
	let image : String?
	let twitter : String?
	let html : String?
	let avatar : String?
	let snapchat : String?

	enum CodingKeys: String, CodingKey {

		case subject = "subject"
		case text = "text"
		case href = "href"
		case image = "image"
		case twitter = "twitter"
		case html = "html"
		case avatar = "avatar"
		case snapchat = "snapchat"
	}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.href, forKey: .href)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.twitter, forKey: .twitter)
        try container.encodeIfPresent(self.html, forKey: .html)
        try container.encodeIfPresent(self.avatar, forKey: .avatar)
        try container.encodeIfPresent(self.snapchat, forKey: .snapchat)
    }
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		subject = try values.decodeIfPresent(String.self, forKey: .subject)
		text = try values.decodeIfPresent(String.self, forKey: .text)
		href = try values.decodeIfPresent(String.self, forKey: .href)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		twitter = try values.decodeIfPresent(String.self, forKey: .twitter)
		html = try values.decodeIfPresent(String.self, forKey: .html)
		avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
		snapchat = try values.decodeIfPresent(String.self, forKey: .snapchat)
	}

}
