extends Resource
class_name Cyd_Question

enum QuestionType {TEXT, IMAGE}

export(String) var question_info_cyd
export(QuestionType) var type
export(Array, Texture) var options
export(Texture) var correct
