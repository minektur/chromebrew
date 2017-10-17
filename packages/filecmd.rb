require 'package'

class Filecmd < Package
  description 'file command determines the file type.'
  homepage 'ftp://ftp.astron.com/pub/file'
  version '5.32'
  source_url 'ftp://ftp.astron.com/pub/file/file-5.32.tar.gz'
  source_sha256 '8639dc4d1b21e232285cd483604afc4a6ee810710e00e579dbe9591681722b50'

  binary_url ({
    x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/filecmd-5.32-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    x86_64: 'b016618a9f661bfef469a21d78cd66312de376dc10a32f8598112c20459542b2',
  })

  def self.build
    system "./configure --libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make", "check"
  end
end
