#!/usr/bin/env rake

require 'git'
require 'gems'

def git
  @git ||= Git.open Dir.pwd
end

def gemspec
  @gemspec ||= git.ls_files.keys.select { |f| f.end_with? '.gemspec' }.first
end

def spec
  @spec ||= Gem::Specification.load gemspec
end

def already_pushed?
  Gems.versions(spec.name).map { |v| v['number'] }.include? spec.version.version
end

task :tag do
  git.checkout 'develop'
  version = spec.version.version
  git.add_tag version unless git.tags.map(&:name).include? version
end

task :build do
  sh "gem build #{gemspec}"
end

task :publish do
  Gems.push File.new spec.file_name unless already_pushed?
end

task :push do
  threads = []
  git.branches.select(&:remote)
    .map { |branch| [branch.remote.name, branch.name] }
    .each do |remote, branch|
    STDERR.puts "START #{remote}/#{branch}"
    threads << Thread.new do
      git.push remote, branch, tags: true
      STDERR.puts "FINISH #{remote}/#{branch}"
    end
  end
  threads.each(&:join)
end

task :merge do
  git.branch('master').merge(spec.version.version)
end

task release: [:build, :tag, :merge, :publish, :push]
