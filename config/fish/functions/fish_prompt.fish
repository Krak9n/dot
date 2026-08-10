function fish_prompt 
	set -g __fish_git_prompt_showupstream auto
	set -l last_status $status
	set -l stat
	if test $last_status -ne 0
        	set stat (set_color red)"[$last_status] "(set_color --reset)
    	end
	string join '' -- (set_color white) ' λ ' (fish_git_prompt) ' ' (set_color --reset) (prompt_login) ' ' (prompt_pwd --full-length-dirs 2) '> ' $stat
end
