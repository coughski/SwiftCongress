//
//  MembersViewModel.swift
//  SwiftCongress
//
//  Created by Kuba Szulaczkowski on 2/22/23.
//

import Foundation

class MembersViewModel: ObservableObject {
    @Published var members: [Member] = []
    
    private static let membersRequestURL = "https://api.congress.gov/v3/member?api_key=\(CONGRESS_API_KEY)"
    
    func load() {
        NetworkingManager.shared.request(Self.membersRequestURL, type: MemberResponse.self) { [weak self] result in
            
            switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let response):
                    self?.members = response.members.map(\.member)
            }
        }
    }
}
