import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {

    func available(_ skill: String, _ tree: String) -> Bool {
        let alza = tree.filter { skill.contains($0) }
        return skill.starts(with: alza)
    }

    return skill_trees.map { available(skill, $0) }.filter { $0 }.count
}
