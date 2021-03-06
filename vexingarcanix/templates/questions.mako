<%inherit file="shell.mako" />

<%block name="main_content">
    ${self.flash_message()}
    ${self.question_block()}
</%block>

<%def name="question_block()">
    <p>We're going to ask a question about ${card}.</p>
    <hr>
    <div style="width: 75%; margin: auto;">
        <p>${question}</p>
        <form action='/answer' method='post'>
            % for answer in possible_answers:
            <div style='display: block;'>
                <input type='radio' name='answer' value='${answer}' style='margin-right: 10px;' />
                <span>${answer} ${answer_suffix}</span>
            </div>
            % endfor
            <br>
            <input type="submit" value="Submit answer" style='margin: 5px;'>
        </form>
    </div>

    <hr>

    <h2><a href='/ask'>Try again</a></h2>
    <h2><a href='/'>Start over</a></h2>
</%def>


<%def name="flash_message()">
    % if last_given_answer:
        % if last_was_correct:
        <div><h2>You answered the previous question correctly!</h2></div>
        % else:
        <div><h2>You did not answer the previous question correctly.</h2></div>
        % endif
        <div><p>Your answer was: ${last_given_answer}. The correct answer was ${last_correct_answer}</p></div>
    % endif
</%def>
