
describe file('/usr/local/aws/bin/aws') do
  it { should be_file }
  it { should be_executable }
end

describe file('/usr/local/bin/aws') do
  it { should be_symlink }
  its('link_path') { should eq '/usr/local/aws/bin/aws' }
end

describe command('aws --version') do
  its('exit_status') { should eq 0 }
  its('stderr') { should contain 'aws-cli' }
end
