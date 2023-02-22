//
//  MemberCell.swift
//  SwiftCongress
//
//  Created by Kuba Szulaczkowski on 2/20/23.
//

import SwiftUI

struct MemberCell: View {
    let member: Member
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageUrl = member.imageURL {
                let url = URL(string: imageUrl)
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                } placeholder: {
                    ZStack {
                        Image(systemName: "person.fill")
                            .imageScale(.large)
                            .font(.system(size: 100))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .frame(height: 250)
                            .background(.quaternary, in: Rectangle())
                        ProgressView()
                    }
                }
            } else {
                Image(systemName: "person.fill")
                    .imageScale(.large)
                    .font(.system(size: 100))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .frame(height: 250)
                    .background(.quaternary, in: Rectangle())
            }
            
            VStack(alignment: .leading) {
                Text(member.name)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                Text("\(member.party) Party")
                Text(member.state)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
        }
        .frame(maxWidth: 190)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .primary.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

struct MemberCell_Previews: PreviewProvider {
    static var previews: some View {
        MemberCell(member: Member(id: "", name: "Paul, Rand", party: "Republican", state: "Kentucky", imageURL: "https://www.congress.gov/img/member/p000603_200.jpg"))
            .frame(width: 200)
            .padding()
    }
}
