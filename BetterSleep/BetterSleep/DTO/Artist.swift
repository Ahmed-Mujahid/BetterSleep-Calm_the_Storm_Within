/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Artist : Codable {
	let avatar : String?
	let name : String?
	let verified : Bool?
	let weburl : String?
	let adamid : String?

	enum CodingKeys: String, CodingKey {

		case avatar = "avatar"
		case name = "name"
		case verified = "verified"
		case weburl = "weburl"
		case adamid = "adamid"
	}
    
     init() {
         self.avatar = Constants.blankValue
        self.name = Constants.blankValue
        self.verified = Constants.falseValue
        self.weburl = Constants.blankValue
        self.adamid = Constants.blankValue
    }
    
    init(avatar: String? = nil, name: String? = nil, verified: Bool? = nil, weburl: String? = nil, adamid: String? = nil) {
        self.avatar = avatar
        self.name = name
        self.verified = verified
        self.weburl = weburl
        self.adamid = adamid
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.avatar, forKey: .avatar)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.verified, forKey: .verified)
        try container.encodeIfPresent(self.weburl, forKey: .weburl)
        try container.encodeIfPresent(self.adamid, forKey: .adamid)
    }
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		verified = try values.decodeIfPresent(Bool.self, forKey: .verified)
		weburl = try values.decodeIfPresent(String.self, forKey: .weburl)
		adamid = try values.decodeIfPresent(String.self, forKey: .adamid)
	}

}
