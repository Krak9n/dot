function sudo --wraps=sudo --description "sudo rm -rf thy ass"
	 if echo "$argv" | grep -qE 'rm\s+.*-[a-zA-Z]*(rf|fr)[a-zA-Z]*'
	    read --prompt "echo 'sudo rm -rf was called! type yes to confirm: '" confirm
	    test "$confirm" != "yes"; and return 1
	 end
	 command sudo $argv
end