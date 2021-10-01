//
//  File.swift
//  
//
//  Created by CHIEN-MING LEE on 2021/10/1.
//

import Foundation

class SolutionWithoutDP {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
            let chars1 = Array(s1)
            let chars2 = Array(s2)
            let chars3 = Array(s3)

            let result1 = compare(chars3, 0, chars1, 0, chars2, 0)
            let result2 = compare(chars3, 0, chars2, 0, chars1, 0)

            return result1 || result2
        }

    private func compare(_ s3: Array<Character>, _ idx3: Int,
                         _ s1: Array<Character>, _ idx1: Int,
                         _ s2: Array<Character>, _ idx2: Int) -> Bool {
        if idx1 == s1.count - 1 && idx3 == s3.count - 1 && s3[idx3] == s1[idx1] && idx2 == s2.count {
            return true
        }
        if idx1 == s1.count || idx3 == s3.count {
            return false
        }
        if s3[idx3] != s1[idx1] {
            return false
        }

        let result1 = compare(s3, idx3+1, s2, idx2, s1, idx1+1)
        let result2 = compare(s3, idx3+1, s1, idx1+1, s2, idx2)

        return result1 || result2
    }
}
