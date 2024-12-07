//
//  File.swift
//  
//
//  Created by CHIEN-MING LEE on 2021/12/20.
//

import Foundation

typealias Vertex = Int
typealias Edge = (parent: Vertex, child: Vertex)

final class SimpleGraph {
    
    private var graphMap: [Vertex: Array<Vertex>] = [:]
    
    func getList(of vertex: Vertex) -> Array<Vertex> {
        guard let list = graphMap[vertex] else { return [] }
        
        return list
    }
    
    func addEdge(_ edge: Edge) {
        let parent = edge.parent
        let child = edge.child
        
        if graphMap[parent] == nil {
            graphMap[parent] = []
        }
        
        var list = graphMap[parent]!
        list.append(child)
        graphMap[parent] = list
    }
    
    func topologicalSort() -> Array<Vertex> {
        
    }
    
    private func recursiveSort(vertex: Vertex, sorted: Array<Vertex>)
}
