impl question.ask{
    q_text = visitor.questions[visitor.index];
    correct = visitor.answers[visitor.index];
    

    ans = input(q_text + " ");
    visitor.check_answer(ans);

    visitor.index += 1;
    visit [-->];
}


impl QuizGame.start_game{
    end: `root | q = here;
    print('Welcome to this Riddle Game. Lets see how many you can get');
    for i = 0 to i < 5 by i += 1 {
        end ++> (end := question());
    }
    visit [-->];
}

impl QuizGame.check_answer(ans: str) {
    answer: str = give_answer(self.answers[self.index]).lower();
    if ans.lower() == answer {
        print("Correct!");
    } else {
        print("Wrong. The right answer was: " + answer);
    }
    if self.index == 4 {
        print("Quiz finished!");
        disengage;
    }
}