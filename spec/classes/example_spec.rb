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

          it { is_expected.to contain_firewall('000 accept all icmp') }
          it { is_expected.to contain_firewall('001 accept all to lo interface') }
          it { is_expected.to contain_firewall('002 accept related established rules') }
          it { is_expected.to contain_firewall('010 allow internal netA TCP') }
          it { is_expected.to contain_firewall('011 allow internal netB TCP') }
          it { is_expected.to contain_firewall('012 allow internal netC TCP') }
          it { is_expected.to contain_firewall('013 allow internal netD TCP') }
          it { is_expected.to contain_firewall('014 allow internal netE TCP') }
          it { is_expected.to contain_firewall('020 allow internal netA UDP') }
          it { is_expected.to contain_firewall('021 allow internal netB UDP') }
          it { is_expected.to contain_firewall('022 allow internal netC UDP') }
          it { is_expected.to contain_firewall('023 allow internal netE UDP') }
          it { is_expected.to contain_firewall('025 allow internal netA TCP rangeB') }
          it { is_expected.to contain_firewall('026 allow internal netB TCP rangeB') }
          it { is_expected.to contain_firewall('027 allow internal netC TCP rangeB') }
          it { is_expected.to contain_firewall('028 allow internal netD TCP rangeB') }
          it { is_expected.to contain_firewall('029 allow internal netE TCP rangeB') }
          it { is_expected.to contain_firewall('035 allow internal netA TCP rangeC') }
          it { is_expected.to contain_firewall('036 allow internal netB TCP rangeC') }
          it { is_expected.to contain_firewall('037 allow internal netC TCP rangeC') }
          it { is_expected.to contain_firewall('038 allow internal netD TCP rangeC') }
          it { is_expected.to contain_firewall('900 log all drop connections') }
          it { is_expected.to contain_firewall('950 drop udp') }
          it { is_expected.to contain_firewall('951 drop tcp') }
          it { is_expected.to contain_firewall('952 drop icmp') }
          it { is_expected.to contain_firewall('999 drop everything else - this is the failsafe rule') }

        end
      end
    end
  end
end
