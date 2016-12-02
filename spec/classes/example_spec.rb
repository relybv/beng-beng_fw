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
          it { is_expected.to contain_class('beng_fw::install') }
          it { is_expected.to contain_class('beng_fw::prev4') }
          it { is_expected.to contain_class('beng_fw::postv4') }

        end
      end
    end
  end
end
