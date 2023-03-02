using App
using ArgParse

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table! s begin
        "--input"
            help = "Path to the input file."
            arg_type = String
            required = true
        "--output"
            help = "Path to the output file."
            arg_type = String
            required = true
    end

    return parse_args(s)
end

function main()
    args = parse_commandline()
    input = readlines(args["input"])
    v = parse.(Int, input)
    output = join(append_sum(v), '\n')
    write(args["output"], output)
end

main()
