//
//  ContentView.swift
//  SwiftCongress
//
//  Created by Kuba Szulaczkowski on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var members = [Member]()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: UIColor.secondarySystemBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(members) { member in
                            NavigationLink {
                                MemberDetail(member: member)
                            } label: {
                                MemberCell(member: member)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding()
                    .onAppear {
                        NetworkingManager.shared.request { data in
                            let serverResponse = try! JSONDecoder().decode(MemberResponse.self, from: data)
                            members = serverResponse.members.map(\.member)
                        }
                    }
                }
            }
            .navigationTitle("Members")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
