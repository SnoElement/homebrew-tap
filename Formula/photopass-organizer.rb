class PhotopassOrganizer < Formula
  include Language::Python::Virtualenv

  desc "Sort Disney PhotoPass downloads by day and park, and share them with friends"
  homepage "https://github.com/SnoElement/photopass-organizer"
  url "https://github.com/SnoElement/photopass-organizer/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a8bc76c146cb7729105ec3a9f2f12d57615e57a93bf04542efabfaa8f6a5e969"
  license "MIT"
  head "https://github.com/SnoElement/photopass-organizer.git", branch: "main"

  depends_on "pillow"
  depends_on "python@3.14"

  resource "tomli-w" do
    url "https://files.pythonhosted.org/packages/19/75/241269d1da26b624c0d5e110e8149093c759b7a286138f4efd61a60e75fe/tomli_w-1.2.0.tar.gz"
    sha256 "2dd14fac5a47c27be9cd4c976af5a12d87fb1f0b4512f81d69cce3b35ae25021"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "review", shell_output("#{bin}/photopass-organizer --help")
    system bin/"photopass-organizer", "init", "--state-dir", testpath/"state"
    assert_path_exists testpath/"state/photopass.toml"
  end
end
