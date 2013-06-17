#!/usr/bin/env ruby

require 'optparse'
require 'fileutils'

def collapse_dir(target_dir, destination_dir)
    # Moves all of the files from target_dir into destination_dir and
    # then removes target_dir
    FileUtils.mkdir destination_dir if not File.directory?(destination_dir)
    FileUtils.mv Dir.glob("#{target_dir}/*"), destination_dir
    FileUtils.remove_dir target_dir
end

def collapse(target_dir, destination_dir, recursively)
    if recursively
        Dir.foreach(target_dir) do |item|
            next if item == '.' or item == '..'
            path = "#{target_dir}/#{item}"
            if File.directory?(path)
                collapse path, target_dir, recursively
            end
        end
    end

    temporary_storage = "#{destination_dir}/.ko"
    collapse_dir target_dir, temporary_storage
    collapse_dir temporary_storage, destination_dir
end

def run()
    options = {}
    option_parser = OptionParser.new do |opts|
        opts.banner = "usage: #{File.basename($PROGRAM_NAME)} [-r] target_dir\n\n"
        opts.on(
            '-r',
            '--recursively',
            'collapse entire directory tree'
        ) do
            options[:recursively] = true
        end
    end
    option_parser.parse!
    if ARGV.empty?
        puts option_parser.help
    else
        target_dir = ARGV[0]

        collapse target_dir, '.', options[:recursively]
    end
end

run
