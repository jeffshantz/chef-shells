require 'spec_helper'

describe 'shells::default' do

  %w[bash tcsh ksh zsh].each do |pkg|
    describe package(pkg) do
      it { should be_installed}
    end
  end

  describe file('/usr/local/shells') do
    it { should be_directory }
  end

  describe file('/usr/local/shells/bash') do
    it { should be_linked_to '/bin/bash' }
  end

end