
import Foundation

struct Artists : Codable {
    // MARK: - Properties
    let hits : [Hits]?
    
   
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        
        case hits = "hits"
    }
    
    // MARK: - Initialiser
    init() {
        self.hits = [Hits]()
    }
    
    init(hits: [Hits]? = nil) {
        self.hits = hits
    }
    
    // MARK: - ENCODER & DECODER
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hits = try values.decodeIfPresent([Hits].self, forKey: .hits)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.hits, forKey: .hits)
    }
    
    
    
}
