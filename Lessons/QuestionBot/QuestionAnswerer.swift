struct MyQuestionAnswerer {
    func responseTo(question: String) -> String {
        let questionLowercased = question.lowercased()
        if questionLowercased.count > 35 {
            return "Demasiadas palabras!"
        }
        else if questionLowercased.hasPrefix("como"){
            return "Como quieras, de cualquier manera, da igual."
        }
        else if questionLowercased.hasPrefix("donde"){
            return "La respuesta está en tu corazón"
        }
        else if questionLowercased.hasPrefix("que"){
            return "Qué de qué?"
        }
        else if questionLowercased.hasPrefix("me quiere"){
            return "Pero solo como amigos"
        }
        else if questionLowercased.contains("día"){
            return "No importa que día es..."
        }
        else{
            return "?"}
    }
}
