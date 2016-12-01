require 'spec_helper'

describe 'beng_fw' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            :concat_basedir => "/foo"
          })
        end

        context "beng_fw class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('beng_fw') }
 
          it { is_expected.to contain_class('beng_fw::params') }
          it { is_expected.to contain_class('beng_fw::install').that_comes_before('beng_fw::config') }
          it { is_expected.to contain_class('beng_fw::config') }
          it { is_expected.to contain_class('beng_fw::service').that_subscribes_to('beng_fw::config') }

          it { is_expected.to contain_service('beng_fw') }
          it { is_expected.to contain_package('beng_fw').with_ensure('present') }

        end
      end
    end
  end
end
