require 'spec_helper'

describe 'Language Switcher' do
  let(:site) { Jekyll::Site.new(site_configuration) }
  let(:page) { Jekyll::Page.new(site, site.source, '', 'test-page.html') }
  let(:content) { File.read(File.join(site.source, '_includes/header.html')) }
  let(:template) { Liquid::Template.parse(content) }
  let(:site_data) { { 'languages' => ['en', 'hr'], 'default_lang' => 'en', 'title' => 'Test Site' } }

  context 'when viewing English page' do
    before do
      page.data['lang'] = 'en'
      page.data['url'] = '/en/test-page'
    end

    it 'shows EN as current language' do
      rendered = template.render('page' => page.data, 'site' => site_data)
      rendered.should include('<span class="current-lang">EN</span>')
    end

    it 'shows link to Croatian version' do
      rendered = template.render('page' => page.data, 'site' => site_data)
      rendered.should include('<a href="/hr/test-page">HR</a>')
    end
  end

  context 'when viewing Croatian page' do
    before do
      page.data['lang'] = 'hr'
      page.data['url'] = '/hr/test-page'
    end

    it 'shows HR as current language' do
      rendered = template.render('page' => page.data, 'site' => site_data)
      rendered.should include('<span class="current-lang">HR</span>')
    end

    it 'shows link to English version' do
      rendered = template.render('page' => page.data, 'site' => site_data)
      rendered.should include('<a href="/en/test-page">EN</a>')
    end
  end

  context 'path handling' do
    it 'correctly handles language prefixes' do
      page.data['lang'] = 'en'
      page.data['url'] = '/en/deep/nested/page'
      rendered = template.render('page' => page.data, 'site' => site_data)
      rendered.should include('<a href="/hr/deep/nested/page">HR</a>')
    end
  end

  context 'nested pages in different languages' do
    it 'switches from English nested page to Croatian version' do
      page.data['lang'] = 'en'
      page.data['url'] = '/en/services/dental/cleaning'
      rendered = template.render('page' => page.data, 'site' => site_data)
      rendered.should include('<span class="current-lang">EN</span>')
      rendered.should include('<a href="/hr/services/dental/cleaning">HR</a>')
    end

    it 'switches from Croatian nested page to English version' do
      page.data['lang'] = 'hr'
      page.data['url'] = '/hr/services/dental/cleaning'
      rendered = template.render('page' => page.data, 'site' => site_data)
      rendered.should include('<span class="current-lang">HR</span>')
      rendered.should include('<a href="/en/services/dental/cleaning">EN</a>')
    end

    it 'preserves full path structure when switching languages' do
      page.data['lang'] = 'en'
      page.data['url'] = '/en/about/team/doctors/smith'
      rendered = template.render('page' => page.data, 'site' => site_data)
      rendered.should include('<a href="/hr/about/team/doctors/smith">HR</a>')
    end
  end
end 