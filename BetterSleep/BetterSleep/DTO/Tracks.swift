import Foundation

struct Tracks : Codable {
    let hits : [Hits]?
    
    enum CodingKeys: String, CodingKey {
        case hits = "hits"
    }
    
    init() {
        self.hits = [Hits]()
    }
    
    init(hits: [Hits]? = nil) {
        self.hits = hits
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.hits, forKey: .hits)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hits = try values.decodeIfPresent([Hits].self, forKey: .hits)
    }
    
}
