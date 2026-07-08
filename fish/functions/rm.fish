function rm --wraps=rm --description "safe delete"
	 set cmd "rm $argv"
	 if echo "$cmd" | grep -qE "(sudo\s+)?rm\s+.*-[a-zA-Z]*(rf|fr)[a-zA-Z]*"
	    read --prompt "echo 'confirmation? 'yes' to confirm: '" confirms
	    if test "$confirms" != yes
	       echo "aborted."
	       return 1
	    end
	    command rm $argv
	 end
     command rm $argv
end
