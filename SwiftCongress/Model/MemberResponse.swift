//
//  MemberResponse.swift
//  SwiftCongress
//
//  Created by Kuba Szulaczkowski on 2/20/23.
//

struct MemberResponse: Decodable {
    let members: [MemberWrapper]
    
    enum CodingKeys: CodingKey {
        case members
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        members = try container.decode([MemberWrapper].self, forKey: .members)
    }
    
    struct MemberWrapper: Decodable {
        let member: Member
    }
}
