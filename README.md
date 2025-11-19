# obs_trail_effect
A setup for doing a trail effect on OBS sources

Here's a overview on how to do a trail effect on a source in OBS. Note that my set up is for a 30 FPS webcam, so if you are using a higher FPS source, you may need to tweak a few things.

You'll need 2 plugins for OBS -

https://obsproject.com/forum/resources/obs-shaderfilter.1736/ - Exeldro's User Defined Shader plugin. This comes with a bunch of effects too and is SUPER powerful!

https://obsproject.com/forum/resources/advanced-masks.1856/ - FiniteSingularity's Advanced Mask plugin.

Install these using the instructions for their plugins.

You'll also need the trail.shader file in this repo.

## Setup
1) First, you'll need to set up the source you want to have a trail. We'll refer to this as the Base source. This could be a webcam, vtuber avatar capture, or even just a gif. This, obviously, must have a transparent background so you can see the trail.

2) Add a colour source to your scene, and move it behind the base source. This is the source we will be applying the filters to. We'll call this the Trail Source.

3) Right click the trail source and select Filters. Press the + button in the lower left of the window, and select Advanced Mask, and give it a name.

4) Configure the filter like so:

![image](https://github.com/user-attachments/assets/2d7ca260-d334-4674-9eb3-6ad8872875c3)

The fade-out time will set the "length" of the trail, and you may want to play around with this based on your use case, FPS and the end result appearance.

At this point, you'll see the trail effect as various levels of alpha. We'll now use the User Defined Shader to add the colours we want!

5) Press the + button in the lower left of the window, and select User-defined Shader and give it a name.

6) Tick "Load shader text from file", and Browse to where you stored the .shader file from this repo, and hit Reload Effect.

This should present you with a few settings:

![image](https://github.com/user-attachments/assets/f5168ce4-3394-4e7b-a1b0-c882754a4758)

## Shader Settings
### Custom Alpha:
This replaces the alpha after setting the colour of that part of the trail.
* Off - The further along the trail effect, the more transparent the trail colour will be.
* On - The trail will be uniformly set to be the custom alpha (ie it will be the same transparency on every colour)

### Alpha:
Sets the alpha vaule of the entire trail effect if the Custom Alpha seting is **ENABLED**. Otherwise, this is ignored.

### colour0 through colour6:
* These are the colours, starting at the "closest" to the base source, to the furthest. While you can set the alpha level on the colours, these are clobbered in the shader code. Only the RGB colour values effect the shader.

### Colour 0 Threshold through Colour 6 Threshold:
* These sliders set at what alpha level the colour they control END. For example, by deafult Colour 0 Threshold is 0.8. This means that any pixel in the Advance Mask we set up that is >= 0.8 will be colour0.
* Colour 0 Threshold must be bigger that Colour 1 Threshold, Colour 2 Threshold bigger that Colour 3 Threshold etc.
* These do not have to be evenly spaced. For example, if you wanted to do a trail based on the Bisexuality flag, your first colour could end at 0.6, the stripe at 0.4, and the lower colour 0.0
* Note that due to the way Advanced Mask works, a mask will have to be generated with in the range of the alpha to appear, so you may need to play around with the threshold/trail length.
* If you need less than 7 colours, just put the extra ones at the end to 0.0

To prevent some artefacts, the shader discards any pixel with an alpha under 0.05. If this is causing issues for the effect you want, reach out to me and I can tell you how to tweak that.

Here are some trail examples based on various LGBTQIA+ flags:

![image](https://github.com/user-attachments/assets/03f43534-ad57-4f47-8211-f4505568a302)

If you wanted to add even more colours, the shader code can be modified to have even more colours quite easily. If you'd like more but don't know how to code, reach out to me and I'll give you an expanded version.

Here we have a Trans flag:

![image](https://github.com/user-attachments/assets/e30d7f46-b883-4c98-b61c-41cc68886966)

And Non-Binary:

![image](https://github.com/user-attachments/assets/19181e12-d7bb-4e49-8525-8caa2e91c91a)

If you have any questions, I use this tech on my own Twitch stream https://twitch.tv/omnituens and I'm happy to demo the effects and help you out, assuming I'm not in the middle of something! I'm also on BlueSky here: https://bsky.app/profile/omnituens.bsky.social
If you do use this effect and are asked how you did it, I would be grateful if you pointed them back here, or to my socials. I actually don't mind payment in exposure for this, and if I can get more eyes on Exeldro and FiniteSingularity's work, all the better! I am open to commision work if you are looking for something in particular.

If you want to by me a frappe as a thank you, I do have a ko-fi here: https://ko-fi.com/omnituens but also consider supporting the devs of the 2 plugins used, as without their plugins I could not have done this as gracefully... you don't want to see the first version of this effect, it was a crime against OBS!

