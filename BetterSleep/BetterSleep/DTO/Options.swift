/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Options : Codable {
	let caption : String?
	let actions : [Actions]?
	let beacondata : Beacondata?
	let image : String?
	let type : String?
	let listcaption : String?
	let overflowimage : String?
	let colouroverflowimage : Bool?
	let providername : String?

	enum CodingKeys: String, CodingKey {

		case caption = "caption"
		case actions = "actions"
		case beacondata = "beacondata"
		case image = "image"
		case type = "type"
		case listcaption = "listcaption"
		case overflowimage = "overflowimage"
		case colouroverflowimage = "colouroverflowimage"
		case providername = "providername"
	}
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.caption, forKey: .caption)
        try container.encodeIfPresent(self.actions, forKey: .actions)
        try container.encodeIfPresent(self.beacondata, forKey: .beacondata)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.listcaption, forKey: .listcaption)
        try container.encodeIfPresent(self.overflowimage, forKey: .overflowimage)
        try container.encodeIfPresent(self.colouroverflowimage, forKey: .colouroverflowimage)
        try container.encodeIfPresent(self.providername, forKey: .providername)
    }
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		caption = try values.decodeIfPresent(String.self, forKey: .caption)
		actions = try values.decodeIfPresent([Actions].self, forKey: .actions)
		beacondata = try values.decodeIfPresent(Beacondata.self, forKey: .beacondata)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		listcaption = try values.decodeIfPresent(String.self, forKey: .listcaption)
		overflowimage = try values.decodeIfPresent(String.self, forKey: .overflowimage)
		colouroverflowimage = try values.decodeIfPresent(Bool.self, forKey: .colouroverflowimage)
		providername = try values.decodeIfPresent(String.self, forKey: .providername)
	}

}
