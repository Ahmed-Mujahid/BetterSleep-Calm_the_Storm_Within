/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Track : Codable {
	let layout : String?
	let type : String?
	let key : String?
	let title : String?
	let subtitle : String?
	let share : Share?
	let images : Images?
	let hub : Hub?
	let artists : [Artists]?
	let url : String?

	enum CodingKeys: String, CodingKey {

		case layout = "layout"
		case type = "type"
		case key = "key"
		case title = "title"
		case subtitle = "subtitle"
		case share = "share"
		case images = "images"
		case hub = "hub"
		case artists = "artists"
		case url = "url"
	}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.layout, forKey: .layout)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.subtitle, forKey: .subtitle)
        try container.encodeIfPresent(self.share, forKey: .share)
        try container.encodeIfPresent(self.images, forKey: .images)
        try container.encodeIfPresent(self.hub, forKey: .hub)
        try container.encodeIfPresent(self.artists, forKey: .artists)
        try container.encodeIfPresent(self.url, forKey: .url)
    }
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		layout = try values.decodeIfPresent(String.self, forKey: .layout)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		key = try values.decodeIfPresent(String.self, forKey: .key)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
		share = try values.decodeIfPresent(Share.self, forKey: .share)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
		hub = try values.decodeIfPresent(Hub.self, forKey: .hub)
		artists = try values.decodeIfPresent([Artists].self, forKey: .artists)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}

}
