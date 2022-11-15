//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @StateObject var vm = RecipeViewModel()
    
    let title: String
    let id: String
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Divider()
            ScrollView(showsIndicators: false) {
                ForEach(vm.ingredients, id: \.self) { item in
                    HStack{
                        Image(systemName: "checkmark")
                        
                        Text("\(item)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(0)
                    }
                    .padding(.top)
                }
            }
            Spacer()
        }
        .task {
            vm.recipeId = id
            await vm.findRecipeById()
        }
        .padding()
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(id: "36498", title: "Indian")
    }
}
