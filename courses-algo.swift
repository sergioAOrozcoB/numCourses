import Foundation

func canFinishAllCourses(totalCourses: Int, coursePrerequisites: [[Int]]) -> (Bool, [Int]) {
    var courseDependencies = [[Int]](repeating: [], count: totalCourses)
    for prerequisite in coursePrerequisites {
        let dependentCourse = prerequisite[0]
        let prerequisiteCourse = prerequisite[1]
        courseDependencies[prerequisiteCourse].append(dependentCourse)
    }
    
    var courseStatus = [Int](repeating: 0, count: totalCourses) // 0: not started, 1: in progress, 2: completed
    var courseCompletionOrder = [Int]()
    
    func dfs(_ currentCourse: Int) -> Bool {
        if courseStatus[currentCourse] == 1 {
            return false
        }
        if courseStatus[currentCourse] == 2 {
            return true 
        }
        
        courseStatus[currentCourse] = 1
        for dependentCourse in courseDependencies[currentCourse] {
            if !dfs(dependentCourse) {
                return false
            }
        }
        courseStatus[currentCourse] = 2
        courseCompletionOrder.append(currentCourse)
        return true
    }
    
    for course in 0..<totalCourses {
        if !dfs(course) {
            return (false, []) 
        }
    }
    courseCompletionOrder.reverse()
    return (true, courseCompletionOrder)
}


let totalCourses = 5
let coursePrerequisites = [[1, 0], [2, 0], [3, 1], [3, 2]]

let (canFinish, completionOrder) = canFinishAllCourses(totalCourses: totalCourses, coursePrerequisites: coursePrerequisites)

if canFinish {
    print("You can finish all courses")
} else {
    print("It is not possible to finish all courses.")
}
