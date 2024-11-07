---
layout: post
title: Notes for a future me on MacOS keyboard layouts
categories: [Apple, MacOS, keyboard]
---

![My Keyboard and Trackball](/assets/img/20241106_keyboard.jpeg){:.lead}

I've been using MacOS for a year and a half now, sharing my keyboard and trackball with other OSes like Windows and Linux.
Here are some notes for my future self about MacOS keyboard layouts:

When it comes to keyboard layouts, MacOS has a few tricks up its sleeve. Here are some things to keep in mind:

- It doesn't support US International PC ANSI layout well.  If you want to use accents and other european characters like 'ñ' or 'ç',
 you have to use the US International layout but it comes with some caveats. If you are using a small PC keyboard like mine, you will find you don't have a key between the 'ESC' and the 'TAB' keys.
 MacOS expects that key to manage some characters like '§' That key will be used to type the accents and the 'virgulilla' (tilde, ex: ˜) character.

- The most similar keyboard layout for an ANSI keyboard in Europe is the Irish.  It has the same key distribution as the US International layout, but it has some differences in the characters you can type.
  For example, you can't type the 'ç' character directly.  You have to use the 'Option' key and the 'c' key to type the dot and then press the 'c' key again.  About how to type the 'ñ' character directly, you have to use the 'Option' key and the 'n' key twice to type it.
  A curious thing about the Irish layout is that the '#' character is typed with the 'Option' key and the '3' key.  It's the same as the Spanish layout.  But if you use English as your language, it's a bit confusing.

- There are keyboard remapper tools: these tools can set or build a different layout for mapping your keys accordingly to your needs.

  - At first, I've tried [Ukelele](https://software.sil.org/ukelele/), but I couldn't make it work perfectly for my needs.  Whenever I tried to use the '˜' character, I got really mad.
  Also I found it very difficult to use the tool.  You need to keep a layout in a file outside the "official" MacOS layout files directories (/Library/Keyboard\ Layouts/ and ˜/Library/Keyboard\ Layouts/), and overwrite the previous version each time you make changes.

  - Recently I've been trying [Karabiner-Elements](https://karabiner-elements.pqrs.org/) for a while now, but it's even more complex than Ukelele.  Also, it installs a Virtual Keyboard that intercepts every key you press.  I don't like the idea of having this kind of software running on my computer all the time.
    Today I decided to uninstall it because I haven't succeeded in making it work as I want.  I've been trying to make it work for a week now, and I'm tired of it.

So my advice is to use the English Irish layout and if you need the hash '#' character, use the 'Option' key and the '3' key as in the Spanish layout.
As the latest resort, MacOS has a built-in tool to display the keyboard layout.  You can activate it in the 'System Preferences' -> 'Keyboard' -> 'Input Sources' -> 'Show Input menu in menu bar'.  You can see the layout you are using in the menu bar.  Then you can click on it and select 'Show Keyboard Viewer'.  It will show you the layout you are using and the characters you can type with the keys you press.

I hope this helps you, future me.
