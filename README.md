# ImmersionKit
A collection of tools to aid language learning through immersion, mainly reading and audiovisual media.

This repository contains an explanation of the various tools included in *ImmersionKit* itself, as well as links to
helpful tools maintained by others.
Furthermore, it contains certain configuration files, scripts, or other necessary information to set up the necessary tools
to work with *ImmersionKit*.

**Note**: Certain functionality is currently specific to Japanese.

| Title                                   | Purpose                                                                                                                                                                                                                                                                                                                                        | Repository                                                                                      |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| KOReader Instant Dictionary             | Immediately open the dictionary by tapping a word in KOReader instead of a long-press.                                                                                                                                                                                                                                                         | [Link](https://github.com/UnexpectedTiramisu/immersionkit-koreader-instant-dictionary)          |
| KOReader Dictionary Meta Information    | Show word frequency for each individual word from up two three frequency sources.                                                                                                                                                                                                                                                              | [Link](https://github.com/UnexpectedTiramisu/immersionkit-koreader-dictionary-meta-information) |
| Dictionary Meta DB Builder              | Construct the frequency database used by the dictionary meta information KOReader plugin mentioned above. Currently specific to Japanese.                                                                                                                                                                                                      | [Link](https://github.com/UnexpectedTiramisu/immersionkit-dictionary-meta-db-builder)           |
| Yomitan-like JMDict & JMNEDict StarDict | A tool to construct a StarDict version of JMDict and JMNEDict which is styled more like desktop Yomitan. Downloads of the built files are available in the respository.                                                                                                                                                                        | [Link](https://github.com/UnexpectedTiramisu/immersionkit-jp-yomitanlike-jmdict-stardict)       |
| Subtitle Server                         | Chrome extension and companion server to run on a Linux-based streaming box, extract subtitles from Netflix / Viki / etc., convert them, and serve them for KOReader.                                                                                                                                                                          | [Link](https://github.com/UnexpectedTiramisu/immersionkit-subtitle-server)                      |
| KOReader Subtitle Sync                  | KOReader plugin that works with the subtitle server mentioned above. Uses the server's offered capabilities for synchronisation such that the KOReader device can be used for supplementary study of vocabulary while watching media. Example: Will auto-pause streaming playback when looking up a word in the dictionary.                    | [Link](https://github.com/UnexpectedTiramisu/immersionkit-koreader-subtitle-sync)               |
| WKLike Anki Autocard                    | An Anki plugin that inspects incoming Japanese vocabulary cards for unknown Kanji. It dissects Kanji in visual subcomponents that correspond to WaniKani radicals, then uses a local machine learning model to automatically generate English mnemonic strings using familiar concepts from WaniKani for Kanji and Vocabulary not on WaniKani. | [Link](https://github.com/UnexpectedTiramisu/immersionkit-wklike-anki)                          |

## Recommended tools outside of this repository

### KOReader Tategumi
https://github.com/m-tky/koreader-tategumi

A fork of KOReader that provides vertical text (縦書き) support at rendering engine level.

This is the only version of KOReader any of the plugins in this repository were tested with.
It is the core pillar of the project contained in this repository.

### anki.koplugin
https://github.com/Ajatt-Tools/anki.koplugin

A KOReader plugin that allows the creation of anki cards from the dictionary popup through [AnkiConnect](https://ankiweb.net/shared/info/2055492159).

**Note**: In order to use *anki.koplugin* alongside the *Yomitan-like JMDict & JMNEDict Stardict* provided by this repository, you must install an *anki.koplugin* extension that is provided within this repository under `configurations/koreader/anki.koplugin/extensions/EXT_yomitanlike_stardict_word_lookup.lua`.

### KDE Plasma Bigscreen
This is not strictly required, but a result of my preference.


To use the subtitle server offered in this repository, I set up a streaming box on a *thin client*, specifically a *Fujitsu Futro S7010* with an *Intel J4125* and 4GBs of RAM.
This follows from the fact that an extraction of subtitles is not possible on closed platforms, making a web browser a necessity for this project.

The device runs [*Fedora Linux*](https://fedoraproject.org/) and [*KDE Plasma Bigscreen*](https://plasma-bigscreen.org/), is controlled via an airmouse and runs the subtitle server as a *systemd* service.
The Chrome addon is installed via the Chrome Dev Mode, and therefore this device serves as the server the KOReader Plugin is pointed at.

The service configuration is available as a part of the KOReader Subtitle Sync repository.

#### Auto-connection of bluetooth headphones

Since I use a pair of Apple bluetooth headphones, a script is provided in `configurations/streaming-box/scripts/autoconnect-airpods.sh` to request a connection to the wireless headphones.
This is then configured to run when the user presses a button on the airmouse through a keybind, such that the UI does not have to be navigated to facilitate the connection.

As a result, watching media in another language and glancing at the subtitles
on a separate (E-Ink) device to look up words and create Anki cards is now possible with almost no friction.

#### Auto-Shutdown
The mini pc is configured to boot automatically when supplied with power, like a regular streaming device would.

Since I do not always want to use my TV setup for streaming, leaving the device running seems wasteful.
Therefore, `scripts/shutdown-if-unused.sh` along with its systemd service `shutdown-if-unused.service` provide a oneshot service
to shut down the system if no user input (in this case via the airmouse) is detected within 5 minutes of startup completion.

The device's BIOS config allows USB input to trigger another boot after the shutdown, so the device can be booted again by pressing 
any button on the airmouse.

This provides a way of handling the "unused after startup" scenario without having to rely on shutdown on idle, which could disrupt
the streaming experience when the user has to pause playback for a while.

## System Diagram

When set up fully, *ImmersionKit* provides sofware for
- a system running Anki
- an E-Reader running KOReader
- a streaming box running Google Chrome and Node

to work together, centered around the E-Reader.

The E-Reader can then be used to consume anything "readable", such as
- books
- news
- web articles

as well as subtitles when consuming video-based media.

![](assets/ImmersionKit%20Diagram.png)