"""A Riddle Game"""

import from byllm.llm {Model}

glob llm = Model(model_name='gemini/gemini-2.0-flash', verbose=False);

walker QuizGame {
    has questions: list[str];
    has answers: list[str];

    def init {
        self.questions = [
            "If I drink, I die. If I eat, I am fine. What am I? ",
            "Cloud is my mother. Wind is my father. I come down but never go up. What am I? ",
            "I shrink smaller every time I take a bath. What am I? ",
            "I am an odd number. Take away one letter and I become even. What number am I? ",
            "They come out at night without being called. They are lost in the day without being stolen? "
        ];
        self.answers = [
        "fire",
        "rain",
        "soap",
        "seven",
        "stars"
    ];
    }

    has index: int = 0;

    can start_game with `root entry;
    def check_answer(ans:str);
}

node question {
    can ask with QuizGame entry;
}

# Run the game
 with entry {
    QuizGame() spawn root;
}