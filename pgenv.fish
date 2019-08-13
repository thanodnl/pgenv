complete -c pgenv --exclusive

complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa switch    -d "Set the current PostgreSQL version"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa use       -d "Set and start the current PostgreSQL version"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa clear     -d "Stop and unset the current PostgreSQL version"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa start     -d "Start the current PostgreSQL server"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa stop      -d "Stop the current PostgreSQL server"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa restart   -d "Restart the current PostgreSQL server"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa build     -d "Build a specific version of PostgreSQL"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa remove    -d "Remove a specific version of PostgreSQL"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa version   -d "Show the current PostgreSQL version"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa "versions ls" -d "List all PostgreSQL versions available to pgenv"
complete -c pgenv -n "test (__fish_number_of_cmd_args_wo_opts) = 1" -xa help      -d "Show this usage statement and command summary"


function __pgenv_using_command
    set cmd (commandline -opc)

    if [ (count $cmd) -gt 1 ]
        for arg in $argv
            if [ $arg = $cmd[2] ]
                return 0
            end
        end
    end

    return 1
end

complete -c pgenv -n "__pgenv_using_command switch use remove" -xa "(pgenv versions | sed -E 's/^(\s|\*)*pgsql-//')"
