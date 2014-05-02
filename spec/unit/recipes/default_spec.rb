require 'spec_helper'

describe 'shells::default' do 

  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:shells][:packages] = %w[shell1 shell2]
      node.set[:shells][:symlinks] = {
        '/usr/local/shells/bash' => '/bin/bash',
        '/usr/shells/ksh'        => '/bin/ksh'
      }
    end.converge(described_recipe)
  end

  it 'installs the desired packages' do
    expect(chef_run).to install_package('shell1')
    expect(chef_run).to install_package('shell2')
  end

  it 'creates the parent directory of any shell symlinks' do

    %w[/usr/local/shells /usr/shells].each do |dir|
      expect(chef_run).to create_directory(dir).with({
        owner: 'root',
        group: 'root',
        mode:  '0755'
      })
    end
  end

  it 'creates shell symlinks' do
    expect(chef_run).to create_link('/usr/local/shells/bash').with(to: '/bin/bash')
    expect(chef_run).to create_link('/usr/shells/ksh').with(to: '/bin/ksh')
  end
    
end
