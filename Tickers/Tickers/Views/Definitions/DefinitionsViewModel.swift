//
//  DefinitionsViewModel.swift
//  Tickers
//
//  Created by Alley Pereira on 17/07/23.
//

import SwiftUI
import CoreData

class DefinitionsViewModel: ObservableObject {
    @Published var focusTime: Float = 0
    @Published var shortRest: Float = 0
    
    private let coreDataViewModel: CoreDataViewModel<Definitions> // é a entidade
    
    init(coreDataViewModel: CoreDataViewModel<Definitions> = CoreDataViewModel()) {
        self.coreDataViewModel = coreDataViewModel
        loadTemposDefinidos()
    }
    
    func loadTemposDefinidos() {
        let temposDefinidos = coreDataViewModel.fetchObjects()
        if let tempoDefinido = temposDefinidos.first {
            focusTime = tempoDefinido.focusTime
            shortRest = tempoDefinido.shortRest
        }
    }
    
    func saveTemposDefinidos() {
        let temposDefinidos = coreDataViewModel.fetchObjects()
        
        if let tempoDefinido = temposDefinidos.first {
            tempoDefinido.focusTime = focusTime
            tempoDefinido.shortRest = shortRest
        } else {
            let newTempoDefinido = coreDataViewModel.addObject()
            newTempoDefinido.focusTime = focusTime
            newTempoDefinido.shortRest = shortRest
        }
        
        coreDataViewModel.saveChanges()
    }
    
    func deleteTemposDefinidos() {
        let temposDefinidos = coreDataViewModel.fetchObjects()
        
        for tempoDefinido in temposDefinidos {
            coreDataViewModel.deleteObject(tempoDefinido)
        }
        
        focusTime = 0
        shortRest = 0
    }
}

