//
//  MemberDetail.swift
//  SwiftCongress
//
//  Created by Kuba Szulaczkowski on 2/20/23.
//

import SwiftUI

struct MemberDetail: View {
    let member: Member
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageUrl = member.imageURL {
                let url = URL(string: imageUrl)
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "person.fill")
                    .imageScale(.large)
                    .font(.system(size: 300))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(.quaternary, in: Rectangle())
            }
            
            VStack(alignment: .leading) {
                Text("\(member.party) Party")
                Text(member.state)
            }
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle(member.name)
    }
}

struct MemberDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MemberDetail(member: Member(id: "", name: "Raskin, Jamie", party: "Democratic", state: "Maryland", imageURL: nil))
        }
    }
}
