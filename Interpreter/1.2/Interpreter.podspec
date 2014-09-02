Pod::Spec.new do |s|
  s.name = 'Interpreter'
  s.version = '1.2'
  s.platform = :ios, '6.0'
  s.license = 'Private'
  s.summary = 'Interprets scripts and content markups created using a proprietary mechanism'
  s.homepage = 'http://joysprouts.com'
  s.authors = { 'Stanley Lam' => 'stanleylam@joyaehter.com', 'Matthew Lo' => 'matthewlo@joyaether.com' }
  s.source = { :git => 'https://github.com/joysprouts/interpreter.git', :branch => 'develop' }
  s.requires_arc = false
  s.default_subspec = 'core'

  fb_files = 'VIP\ Library/Social\ Networks/*.{h,m}',
    'VIP\ Library/Sprites/**/*Facebook*.{h,m}'
  exclude_files = 'VIP\ Library/Social\ Networks/*.{h,m}',
    'VIP\ Library/Sprites/**/*Facebook*.{h,m}',
    'VIP\ Library/XML/KissXML/**/*.m',
    'VIP\ Library/Sprites/**/VIPComAir*.{h,m}'

  s.subspec 'core' do |core|
    core.frameworks = 'MessageUI', 'CoreLocation', 'CoreMedia', 'MapKit', 'MediaPlayer', 'UIKit', 'Foundation'
    core.libraries = 'xml2', 'z', 'sqlite3'
    core.dependency 'FMDB', '~>2.3'
    core.dependency 'Interpreter/cocos2d'
    core.dependency 'Interpreter/ddmath'
    core.dependency 'Interpreter/wax'
    core.dependency 'Interpreter/haru'
    core.dependency 'Interpreter/kiss'
    core.xcconfig = { 'OTHER_LDFLAGS' => '$(inherited) -ObjC -all_load', 'HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT) /usr/include/libxml2' }
    core.source_files = 'VIP\ Library/*.{h,m}', 'VIP\ Library/Actions/*.{h,m}', 'VIP\ Library/Additions/*.{h,m}', 'VIP\ Library/Audio/*.{h,m}', 'VIP\ Library/cocos2d Unofficial Sources/**/*.{h,m}', 'VIP\ Library/Database/Models/*.{h,m}', 'VIP\ Library/Database/ORM/*.{h,m}', 'VIP\ Library/PDF/*.{h,m}', 'VIP\ Library/Sprites/**/*.{h,m}', 'VIP\ Library/Support/*.{h,m}', 'VIP\ Library/Transitions/*.{h,m}', 'VIP\ Library/XML/**/*.{h,m}'
    core.exclude_files = exclude_files 
    core.public_header_files = 'VIP\ Library/*.h', 'VIP\ Library/Actions/*.h', 'VIP\ Library/Additions/*.h', 'VIP\ Library/Audio/*.h', 'VIP\ Library/cocos2d Unofficial Sources/**/*.h', 'VIP\ Library/Database/Models/*.h', 'VIP\ Library/Database/ORM/*.h', 'VIP\ Library/PDF/*.h', 'VIP\ Library/Sprites/**/*.h', 'VIP\ Library/Support/*.h', 'VIP\ Library/Transitions/*.h', 'VIP\ Library/XML/**/*.h'
    core.resource_bundle = { 'VIPInterpreterBundle' => ['VIP\ Library/Resources/**/*', 'VIP\ Library/Sprites/**/*.{xml,plist}', 'VIP\ Library/Actions/**/*.{xml,plist}'] }
  end

  s.subspec 'kiss' do |kiss|
    kiss.requires_arc = true
    kiss.source_files = 'VIP\ Library/XML/KissXML/**/*.m'
  end

  s.subspec 'ddmath' do |ddmath|
    ddmath.requires_arc = false
    ddmath.frameworks = 'Foundation'
    ddmath.source_files = 'VIP\ Library/libs/DDMathParser/**/*.{h,m}'
    ddmath.public_header_files = 'VIP\ Library/libs/DDMathParser/**/DD*.h', 'VIP\ Library/libs/DDMathParser/**/*+DDMath*.h'
    ddmath.private_header_files = 'VIP\ Library/libs/DDMathParser/**/_*.h'
  end

  s.subspec 'facebook' do |fb|
    fb.dependency 'Facebook-iOS-SDK', '~>3.17'
    fb.requires_arc = false
    fb.source_files = fb_files
    fb.public_header_files = 'VIP\ Library/Social\ Networks/*.h', 'VIP\ Library/Sprites/**/*Facebook*.h'
  end

  s.subspec 'cocos2d' do |cocos2d|
    cocos2d.requires_arc = false
    cocos2d.frameworks = 'AudioToolbox', 'AVFoundation', 'CoreGraphics', 'OpenAL', 'OpenGLES', 'QuartzCore'
    cocos2d.libraries = 'z'
    cocos2d.source_files = 'VIP\ Library/libs/cocos2d/**/*.{h,m,c}', 'VIP\ Library/libs/CocosDenshion/**/*.{h,m}', 'VIP\ Library/libs/cocoslive/**/*.{h,m}', 'VIP\ Library/libs/FontLabel/**/*.{h,m}', 'VIP\ Library/libs/TouchJSON/**/*.{h,m}'
    cocos2d.public_header_files = 'VIP\ Library/libs/cocos2d/**/*.h', 'VIP\ Library/libs/CocosDenshion/**/*.h', 'VIP\ Library/libs/cocoslive/**/*.h', 'VIP\ Library/libs/FontLabel/**/*.h', 'VIP\ Library/libs/TouchJSON/**/*.h'
    cocos2d.header_mappings_dir = 'cocos2d'
  end

  s.subspec 'wax' do |wax|
    wax.requires_arc = false
    wax.frameworks = 'UIKit', 'CoreGraphics', 'Foundation'
    wax.libraries = 'sqlite3', 'xml2'
    wax.source_files = 'VIP\ Library/libs/wax/**/*.{h,m,c}'
    wax.public_header_files = 'VIP\ Library/libs/wax/**/*.h'
    wax.preserve_paths = 'VIP\ Library/libs/wax/**/*.{sh,lua}'
  end

  s.subspec 'png' do |png|
    png.requires_arc = false
    png.libraries = 'z'
    png.xcconfig = { 'HEADER_SEARCH_PATHS' => '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include', 'PRIVATE_HEADERS_FOLDER_PATH' => '/usr/local/include' }
    png.source_files = 'VIP\ Library/libs/libpng_1_5_4/*.{h,m,c}'
    png.exclude_files = 'VIP\ Library/libs/libpng_1_5_4/pngtest.c', 'VIP\ Library/libs/libpng_1_5_4/pngvalid.c'
    png.public_header_files = 'VIP\ Library/libs/libpng_1_5_4/*.h'
  end

  s.subspec 'haru' do |haru|
    haru.requires_arc = false
    haru.libraries = 'z'
    haru.dependency 'Interpreter/png'
    haru.source_files = 'VIP\ Library/libs/libharu_2_2_1/**/*.{h,m,c}'
    haru.public_header_files = 'VIP\ Library/libs/libharu_2_2_1/*.h'
  end

end
