-- Generated seed: insert missing rows only; run serially after schema creation.

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('228212bf-ccc0-570f-a36f-a5da6b738cda' AS UUID), 'seed-channel:228212bf-ccc0-570f-a36f-a5da6b738cda', '228212bf-ccc0-570f-a36f-a5da6b738cda@catalog.invalid', 'Mark Ronson', CAST('2014-11-19T14:00:18.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2014-11-19T14:00:18.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('228212bf-ccc0-570f-a36f-a5da6b738cda' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID), 'Mark Ronson - Uptown Funk (Official Video) ft. Bruno Mars', 'Official Video for Uptown Funk by Mark Ronson ft. Bruno Mars
Listen to Mark Ronson: https://MarkRonson.lnk.to/listenYD
Subscribe to the official Mark Ronson: https://MarkRonson.lnk.to/subscribeYD

Watch more Mark Ronson videos: https://MarkRonson.lnk.to/listenYD/youtube

Follow Mark Ronson:
Instagram: https://www.instagram.com/iammarkronson
Facebook: https://www.facebook.com/MarkRonson
Twitter: https://x.com/MarkRonson
TikTok: https://www.tiktok.com/@markronson
Website: https://www.markronson.co.uk

#MarkRonson #BrunoMars #MarkRonsonBurnoMars #UptownFunk #NewYearMusic #HappyNewYears #NewYearPlaylist

Lyrics:

[Intro]
Doh
Doh-doh-doh, doh-doh-doh, doh-doh x3
Doh-doh-doh, doh-doh (Aw, ow)

[Verse 1]
This hit, that ice cold
Michelle Pfeiffer, that white gold
This one for them hood girls
Them good girls, straight masterpieces
Stylin'', wilin'', livin'' it up in the city
Got Chucks on with Saint Laurent
Gotta kiss myself, I''m so pretty

[Refrain]
I''m too hot (Hot damn)
Uh, call the police and the fireman
I''m too hot (Hot damn)
Make a dragon wanna retire, man
I''m too hot (Hot damn)
Say my name, you know who I am
I''m too hot (Hot damn)
And my band ''bout that money, break it down

[Pre-Chorus]
Girls hit your hallelujah (Woo) x3
''Cause uptown funk gon'' give it to you (Woo) x3
Saturday night and we in the spot
Don''t believe me, just watch, come on

[Chorus]
Doh
Doh-doh-doh, doh-doh-doh, doh-doh (Ya)
(Doh-doh-doh, doh-doh-doh, doh-doh)
Don''t believe me, just watch, uh
Doh-doh-doh, doh-doh-doh, doh-doh (Ya)
(Doh-doh-doh, doh-doh–)
Don''t believe me, just watch, uh x4
Hey, hey, hey, oh

[Verse 2]
Stop, wait a minute
Fill my cup, put some liquor in it
Take a sip, sign the check
Julio, get the stretch
Ride to Harlem, Hollywood, Jackson, Mississippi
If we show up, we gon'' show out
Smoother than a fresh jar of Skippy

[Refrain]
I''m too hot (Hot damn)
Uh, call the police and the fireman
I''m too hot (Hot damn)
Make a dragon wanna retire, man
I''m too hot (Hot damn)
Say my name, you know who I am
I''m too hot (Hot damn)
And my band ''bout that money, break it down

[Pre-Chorus]
Girls hit your hallelujah (Woo) x3
''Cause uptown funk gon'' give it to you (Woo) x3
Saturday night and we in the spot
Don''t believe me, just watch, come on

[Chorus]
Doh
Doh-doh-doh, doh-doh-doh, doh-doh (Ya)
(Doh-doh-doh, doh-doh-doh, doh-doh)
Don''t believe me, just watch, uh
Doh-doh-doh, doh-doh-doh, doh-doh (Ya)
(Doh-doh-doh, doh-doh–)
Don''t believe me, just watch, uh x4
Hey, hey, hey, oh

[Bridge]

[Chorus]
Doh
Doh-doh-doh, doh-doh-doh, doh-doh (Ya)
(Doh-doh-doh, doh-doh-doh, doh-doh)
Don''t believe me, just watch, uh
Doh-doh-doh, doh-doh-doh, doh-doh (Ya)
(Doh-doh-doh, doh-doh–)
Don''t believe me, just watch, uh x4
Hey, hey, hey, oh', 79, '/media/1aed15ac-1668-5976-9a11-656b42af74a9/thumbnail.webp', '/media/1aed15ac-1668-5976-9a11-656b42af74a9/video.mp4', CAST('228212bf-ccc0-570f-a36f-a5da6b738cda' AS UUID), 5909835460, 23573933, CAST('2014-11-19T14:00:18.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b69c44df-8f99-5fef-88f2-d65dc676ff67' AS UUID), CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID), NULL, 'Christina-y5s', 'The red shoes just feel it just whatever its to iconic here', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b69c44df-8f99-5fef-88f2-d65dc676ff67' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('25432b8e-cded-5733-95d8-aa64fe08837f' AS UUID), CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID), NULL, 'smithsilver2', 'Still one of my favorites', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('25432b8e-cded-5733-95d8-aa64fe08837f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('06bb3bde-c1d8-58ad-80e0-69c9ed3feee1' AS UUID), CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID), NULL, 'stevenclement-u4x', 'I don’t think l could pull of patent leather shoes and a pink jacket, Bruno rocks.😂', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('06bb3bde-c1d8-58ad-80e0-69c9ed3feee1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('48a11f41-d2e2-5ad0-b625-074015b2ec34' AS UUID), CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID), NULL, 'PinkHibiscus-eh9hy', 'Im just here because he mentioned Michelle Pfeiffer', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('48a11f41-d2e2-5ad0-b625-074015b2ec34' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7b6bb9eb-97c0-58a9-9cb5-29ea0f63cd0a' AS UUID), CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID), NULL, 'tinagordon9194', 'It’s a full moon tonight’s got electric n Putin Jesus Christ smen', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7b6bb9eb-97c0-58a9-9cb5-29ea0f63cd0a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1aed15ac-1668-5976-9a11-656b42af74a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('2ba82f4f-dcff-50a6-a6f9-561488e33797' AS UUID), 'seed-channel:2ba82f4f-dcff-50a6-a6f9-561488e33797', '2ba82f4f-dcff-50a6-a6f9-561488e33797@catalog.invalid', 'Ed Sheeran', CAST('2019-06-21T17:20:16.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2019-06-21T17:20:16.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('2ba82f4f-dcff-50a6-a6f9-561488e33797' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), 'Ed Sheeran - Cross Me (feat. Chance The Rapper & PnB Rock) [Official Music Video]', 'The official music video for Ed Sheeran - Cross Me (feat. Chance The Rapper & PnB Rock)
The new album "=" is out now - listen here: https://es.lnk.to/equals
 
Taken from No.6 Collaborations Project released in 2019, which featured the hit singles ''I Don''t Care'', ''Cross Me'', ''Beautiful People'', ''Blow'', ''Best Part of Me'', ''Antisocial'', ''South of the Border'' &''Take Me Back To London''. 
 
Subscribe to the Ed Sheeran channel for all the best and latest official music videos, behind the scenes and live performances.  
http://bit.ly/SubscribeToEdSheeran 
 
See more official videos from Ed Sheeran here: 
https://www.youtube.com/watch?v=ryJgDL9jzKk&list=PLjp0AEEJ0-fGKG_3skl0e1FQlJfnx-TJz 

Listen to more from the No. 6 Collaborations Project here : 
https://www.youtube.com/playlist?list=PLjp0AEEJ0-fHZDWhxhKo0wG08bMUcRy3l
 
Follow Ed Sheeran on: 
Facebook: http://www.facebook.com/EdSheeranMusic  
Twitter: http://twitter.com/edsheeran  
Instagram: http://instagram.com/teddysphotos  
Official Website: http://edsheeran.com  

Directed by Ryan Staake 
Produced by Riff Raff Films 
Executive Producer: Natalie Arnett 
Producer: Tom Knight 
DOP: Kristian Zuniga 
Choreographer: Erin Murray 
Dancer: Courtney Scarr
VFX: MPC 
CG Supervisor: Dominic Alderson
2D Supervisor: Zdravko Stoitchkov 
VFX Producer: Sandra Eklund
Colourist: Duncan Russell 
Motion Capture: Silver Spoon NYC 
Commissioner: Dan Curwin 

About Ed Sheeran: 
Ed Sheeran may be the quintessential pop star of the 2010s: an internationally acclaimed, multi-award winning singer/songwriter who seems to acknowledge no boundaries between styles or eras with elements of folk, hip-hop, pop, dance, soul, and rock woven throughout his music. 

His incredible catalogue includes the studio albums ‘+’ (plus), ‘x’ (multiply) and ‘÷’ (divide) which spawned hit singles such as ‘The A team’ , ’Lego House’, ‘Sing'', ‘Thinking Out Loud’, ‘Photograph’, ‘Shape Of You’, ‘Castle on The Hill’ and ‘Perfect’. 
 
In 2019, Ed Sheeran released the genre-spanning ‘No.6 Collaborations Project’ which featured a wide-range of artists including ‘Justin Bieber’, ‘Camilla’ Cabello’, ‘Travis Scott’, ‘Eminem’, ‘Cardi B, ‘Paulo Londra’, ‘Bruno Mars’ and ‘Stormzy’ amongst many others, producing hits such as ‘I Don’t Care’, ‘Beautiful People’, ‘South of The Border’ and ‘Take Me Back To London’. 
 
#EdSheeran #ChanceTheRapper #CrossMe', 71, '/media/e6a943df-ca76-5c30-b207-de2ab0e04c4a/thumbnail.webp', '/media/e6a943df-ca76-5c30-b207-de2ab0e04c4a/video.mp4', CAST('2ba82f4f-dcff-50a6-a6f9-561488e33797' AS UUID), 54943798, 688330, CAST('2019-06-21T17:20:16.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c0304cb5-3a2d-5bc6-ba3a-48f661de356b' AS UUID), CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), NULL, 'jocaycainday', 'This MV looks Ai scene', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c0304cb5-3a2d-5bc6-ba3a-48f661de356b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b849a955-8176-5be6-a7cc-5c0b79c9eafc' AS UUID), CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), NULL, 'DianaGrabowska-j2m', '🎉', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b849a955-8176-5be6-a7cc-5c0b79c9eafc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6afbbe50-fcfa-5302-8204-e5f758bfa6e9' AS UUID), CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), NULL, 'jocaycainday', 'Nobody Ever Notice PnB Vocal From his Song Pressure Where say the same line part Anything she need, she can call me
Don''t worry ''bout her, that''s my seed, yup, that''s all me
Just know, if you cross her, then you cross me
Cross me, cross me, if you, if you, if you, if you', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6afbbe50-fcfa-5302-8204-e5f758bfa6e9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d0687cdb-c596-584e-b381-1910f8120739' AS UUID), CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), NULL, 'MozellaWilson-v4u', 'The gas station brought me here ❤…still a hit ❤', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d0687cdb-c596-584e-b381-1910f8120739' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('960fd3f8-8319-58e2-bbe5-38d6c6698ad7' AS UUID), CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), NULL, 'MozellaWilson-v4u', 'AND WE GONNA PRAISE HIS HOLY NAME WE GONNA PRAISE HIS HOLY NAME AND WHEN WE PRAY GOD S GONNA MAKE A WAY…TRUE BARS…HALLELUJAH IS THE HIGHEST PRAISE THANK YOU MYKING JESUS FOR RIGHT NOW PAST AND THE FUTURE❤🥰💕', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('960fd3f8-8319-58e2-bbe5-38d6c6698ad7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('13ed0631-9a92-5bbb-ac79-b84dc2d81ae5' AS UUID), CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), NULL, 'Cinnamoncrispus', 'Anything Minnie Mouse needs she can call me .. Mickey Mouse is what I am and I be.  Her King in disguise that''s all me...  Magic Kingdom is here so you can finally see.  Respect is what I ask for, if you cross her then you cross Kingdom rules and it''s all G.  Purple Magic is gonna answer a question that you all have, just see.', NULL, CAST('2026-09-22T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('13ed0631-9a92-5bbb-ac79-b84dc2d81ae5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('24b90ca1-6a82-5e0f-aee3-f2ea4dda3a07' AS UUID), CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID), NULL, 'loriemorris5286', 'Love this song~', NULL, CAST('2026-09-18T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('24b90ca1-6a82-5e0f-aee3-f2ea4dda3a07' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e6a943df-ca76-5c30-b207-de2ab0e04c4a' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('a2c02b8e-715f-5c60-aa1c-a86596001b4f' AS UUID), 'seed-channel:a2c02b8e-715f-5c60-aa1c-a86596001b4f', 'a2c02b8e-715f-5c60-aa1c-a86596001b4f@catalog.invalid', 'QuantumFracture', CAST('2019-12-22T18:39:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2019-12-22T18:39:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('a2c02b8e-715f-5c60-aa1c-a86596001b4f' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID), 'Estar Quieto es IMPOSIBLE', 'Ni en la zona más vacía del espacio, ni en la zona más alejadas, ni poniendo todo el esfuerzo del mundo. Hacer que algo que esté 100% parado no es posible. La cuántica tiene mucho que decir.

No te pierdas ningún video: solo tienes que... SUSCRIBIRTE, ¡es GRATIS!: https://www.youtube.com/user/QuantumFracture?sub_confirmation=1
¡Sígueme en TWITTER! https://twitter.com/QuantumFracture
¡Y también en FACEBOOK! https://www.facebook.com/QuantumFracture
¡Y (sí, como no) también en INSTAGRAM! https://instagram.com/quantumfracture/

-- EL MERCHANDISING DE QUANTUM FRACTURE (new!) --

Lámina: LOS 9 TIPOS DE UNIVERSOS
https://www.mastersoflol.com/product/los-9-tipos-de-universos?utm_campaign=quantumfracture

Lámina: DESMONTANDO EL MODELO DE LA TIERRA PLANA 
https://www.mastersoflol.com/product/desmontando-el-modelo-de-la-tierra-plana?utm_campaign=quantumfracture

Lámina: TRAP DEL TERRAPLANISMO
https://www.mastersoflol.com/product/trap-del-terraplanismo?utm_campaign=quantumfracture

Página de MASTERS OF LOL
https://www.mastersoflol.com/?utm_campaign=quantumfracture


Las animaciones aquí mostradas no pretenden ser precisas, sino mostrar aspectos cualitativos. Tienen propósitos educativos.


REFERENCIAS

Escopeta: My Police 870
https://www.flickr.com/photos/simonov/2821756744
Licencia Creative Commons 2.0, Autor: Mitch Barrie

Carta de Ajuste
https://commons.wikimedia.org/wiki/File:PM5644.svg
Crédito: Ldo, wimedia commons', 29, '/media/e976df5a-32e2-5bb8-9496-a4ba782b5ae9/thumbnail.webp', '/media/e976df5a-32e2-5bb8-9496-a4ba782b5ae9/video.mp4', CAST('a2c02b8e-715f-5c60-aa1c-a86596001b4f' AS UUID), 963146, 65661, CAST('2019-12-22T18:39:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID), 'SCIENCE_AND_TECHNOLOGY'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID) AND category = 'SCIENCE_AND_TECHNOLOGY') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('160a4348-630b-5130-a90a-ee8518d37237' AS UUID), CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID), NULL, 'QuantumFracture', 'Y en el próximo vídeo es hora de que hablemos de un tema importante. Mientras, ¡echadle un ojo al merch del canal!


🌌Lámina: LOS 9 TIPOS DE UNIVERSOS
https://www.mastersoflol.com/product/los-9-tipos-de-universos?utm_campaign=quantumfracture

🌍Lámina: DESMONTANDO EL MODELO DE LA TIERRA PLANA 
https://www.mastersoflol.com/product/desmontando-el-modelo-de-la-tierra-plana?utm_campaign=quantumfracture

🎵Lámina: TRAP DEL TERRAPLANISMO
https://www.mastersoflol.com/product/trap-del-terraplanismo?utm_campaign=quantumfracture

⬜Página de MASTERS OF LOL
https://www.mastersoflol.com/?utm_campaign=quantumfracture', NULL, CAST('2020-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 979
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('160a4348-630b-5130-a90a-ee8518d37237' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f4a1b7f0-3d31-520c-b47b-0ee1a764bcfd' AS UUID), CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID), NULL, 'kaisidhdklalwbfjkskqv3uudi', 'Bu!





Ja, te asusté', NULL, CAST('2020-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f4a1b7f0-3d31-520c-b47b-0ee1a764bcfd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e976df5a-32e2-5bb8-9496-a4ba782b5ae9' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), 'Ya, en serio, ¿Qué es la Energía?', '¿Qué es EXACTAMENTE la Energía? ¿Es una especie de fluido? Hoy vamos a ver la abstracta naturaleza de la energía... Y lo arraigada que está a la estructura misma de la realidad.

No te pierdas ningún video: solo tienes que... SUSCRIBIRTE, ¡es GRATIS!: https://www.youtube.com/user/QuantumFracture?sub_confirmation=1
¡Sígueme en TWITTER! https://twitter.com/QuantumFracture
¡Y también en FACEBOOK! https://www.facebook.com/QuantumFracture
¡Y (sí, como no) también en INSTAGRAM! https://instagram.com/quantumfracture/

Las animaciones aquí mostradas no pretenden ser precisas, sino mostrar aspectos cualitativos. Tienen propósitos educativos.


REFERENCIAS

Foto Calle

Crédito: Yasuyuki HIRATA, flickr.com

https://www.flickr.com/photos/hirata_yasuyuki/3783265035/



Bisturí

Crédito: Jason Rogers, flickr.com

https://www.flickr.com/photos/restlessglobetrotter/2754248687/



Edificio con Ventana

Crédito: Mirabelka szuszu, flickr.com

https://www.flickr.com/photos/_szuszu/46439277072/



Campana Clin
Hand Bells, D, Single.wav
CC BY 3.0
Crédito: InspectorJ, freesound.org
https://www.freesound.org/people/InspectorJ/sounds/339813/

Tono Seleccionar
Game Sound Selection.wav
CC BY 3.0
Crédito: Bertrof, freesound.org
https://www.freesound.org/people/Bertrof/sounds/131658/', 29, '/media/9f9c2db9-a271-59af-ba93-0a9f0d13a161/thumbnail.webp', '/media/9f9c2db9-a271-59af-ba93-0a9f0d13a161/video.mp4', CAST('a2c02b8e-715f-5c60-aa1c-a86596001b4f' AS UUID), 1942947, 86566, CAST('2019-01-10T22:57:47.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), 'SCIENCE_AND_TECHNOLOGY'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND category = 'SCIENCE_AND_TECHNOLOGY') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('da1a2f1c-280a-59ae-83bb-067a74b7b8d9' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'QuantumFracture', 'Qué buena energía positiva transmitís. (ok no)', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4300
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('da1a2f1c-280a-59ae-83bb-067a74b7b8d9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b41fafbe-519a-5f80-a6b9-0084144666dc' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'elgaro', 'Excelente explicación! Iba a comentar que la energía de un fotón no se conserva cuando el espacio en el que viaja se expande, pero es un detalle y creo que quedó salvado al final del video. Muy claro el concepto.', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 9
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b41fafbe-519a-5f80-a6b9-0084144666dc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0fe52116-5714-5f31-9b01-bf881726ddcb' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'rodrigolopez3874', ' @elgaro  Que interesante, no había caído en eso. Se transforma en energía oscura o simplemente falla la ley de conservación y se pierde la energía?', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0fe52116-5714-5f31-9b01-bf881726ddcb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('90cff391-bf9c-57c1-92e5-a895dd3cb0cc' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'elgaro', ' @rodrigolopez3874  Recuerdo que alguien hizo la cuenta y la cantidad de energía asociada al vacío no se iguala a la que pierde un fotón al expandirse el espacio, así que le siguen llamando energía oscura. Hasta donde sé, Serra energía se pierde. Sería interesante escuchar a Crespo contando a donde va.', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('90cff391-bf9c-57c1-92e5-a895dd3cb0cc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3600dba1-898b-5cac-9cf9-7f436ff5fb1e' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'JGCuber-xd', '​ @elgaro  a ningún lado, ya se que no es como un fluido o algo así pero imagínate unas tuberías en la que pasa agua y ahora ponelo como curvo (las tuberías son rectas) y vas a notar que se pierde agua por los huecos, esa sería una forma de ver porque aveces la energía no se conserva, el agua sería la energía y las tuberías curvas el espacio tiempo curvo 😅 hay un vídeo de veritasium que explica porque aveces la energía no se conserva 😅.



Ya se que pusiste ese comentario hace 7 años pero por si acaso 😅😅😅', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3600dba1-898b-5cac-9cf9-7f436ff5fb1e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('72df3f0c-9994-5840-b4da-2cf0dc18ad93' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'omhar78', '​​ @elgaro Disculpa se que son muchos años en el futuro después de tu comentario, pero no puedo dormir con esto en la cabeza y lo he buscado, hacia donde va la energía de ese fotón? En que se convierte? Ojalá algún día veas este comentario 🙏

Se que sucede una representación del efecto Doppler en la qué su longitud de onda se hace más larga, pero eso como se representa? El fotón va cambiando su espectro de luz hasta llegar a luz roja? Y luego de eso que pasa?', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('72df3f0c-9994-5840-b4da-2cf0dc18ad93' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0a2f8e47-faa7-5e3f-956c-c37eb221e842' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'JGCuber-xd', '​ @omhar78  pasa al inflarrojo y así hasta (que yo sepa nose😅) desaparece 😅', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0a2f8e47-faa7-5e3f-956c-c37eb221e842' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6d56cda2-55fd-5a91-8c67-22deec96e358' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'hoyosalvamanuelalejandro9940', 'El mejor video de fisica que he visitó,  increiblemente bien explicado y con una profundidad enorme, solo por eso voy a empezar a trabajar, pa darte dinero por patreon te amo', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6d56cda2-55fd-5a91-8c67-22deec96e358' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a749a4c9-bb7f-5654-9d25-546e9244209a' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'architect8675', 'Ese momento donde mencionas la fuerza de la gravedad pero en otro video has dicho que la gravedad no es una fuerza ;v', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a749a4c9-bb7f-5654-9d25-546e9244209a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5dfc4d68-46bb-513a-9f4a-f820c542a92b' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'nataliogiulianibenavidez22', ' @architect8675  una contradicción que no entiendo', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5dfc4d68-46bb-513a-9f4a-f820c542a92b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6518a0fd-d4d1-5af3-b773-45478964d3a7' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'nataliogiulianibenavidez22', ' @architect8675  tal vez la ven como fuerza pero no lo es', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6518a0fd-d4d1-5af3-b773-45478964d3a7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('27f03f63-de50-5161-9bdd-a87fbd1308f2' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'JGCuber-xd', '​ @architect8675  es más corto decir la fuerza de la gravedad que el espacio tiempo curvo, o nosé 😅', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('27f03f63-de50-5161-9bdd-a87fbd1308f2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('95ea89ad-724e-50d9-a556-d69be68f4d19' AS UUID), CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID), NULL, 'sersama', 'Soy de letras pero me gusta la ciencia y por eso voy a decir esta mierda
Que pasaria si la trasmision de calor fuese al reves. Es decir. Que los cuerpos frios compartiesen la energia a los mas calidos en vez de los calidos a los frios?
Seguramente sera una gilipollez pero no se xd
Me gusta rayarme con estas tonterias', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('95ea89ad-724e-50d9-a556-d69be68f4d19' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9f9c2db9-a271-59af-ba93-0a9f0d13a161' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), 'Nadie Podría Sobrevivir dentro del Traje de IronMan | Los Errores Científicos de Marvel', 'El Universo Marvel es maravilloso... Pero tiene algunos errores científicos: ¿Podrías ponerte la armadura de IronMan sin estirar la pata en el acto? ¿Puede el traje de Black Panther absorber tanta energía? ¿Es realista el mundo cuántico de AntMan? ¡Hoy vamos a ver unos cuantos!

Descubre la ciencia de tus libros y películas favoritas con LA CIENCIA DE LA CIENCIA FICCIÓN, de la editorial Shackleton Books, ya a la venta en librerías.
Para saber más aquí: http://bit.ly/2JpfoWF
Participa en el sorteo de varios ejemplares: https://goo.gl/WwiAcC

No te pierdas ningún video: solo tienes que... SUSCRIBIRTE, ¡es GRATIS!: https://www.youtube.com/user/QuantumFracture?sub_confirmation=1
¡Sígueme en TWITTER! https://twitter.com/QuantumFracture
¡Y también en FACEBOOK! https://www.facebook.com/QuantumFracture
¡Y (sí, como no) también en INSTAGRAM! https://instagram.com/quantumfracture/

Las animaciones aquí mostradas no pretenden ser precisas, sino mostrar aspectos cualitativos. Tienen propósitos educativos.


REFERENCIAS

Tanque
Crédito: Fekin Dooley, flickr.com
https://www.flickr.com/photos/pagedooley/2743308561/

Maquina Sube
Crédito: Halleck, freesound.org
https://www.freesound.org/people/Halleck/sounds/19336/

Música: 

Mermaid Tears
Crédito: Sarah the Illstrumentalist, epidemic sound

Permanent Record
Crédito: Sarah the Illstrumentalist, epidemic sound', 78, '/media/8c9d8cca-b2e7-59fc-98fe-aea704848660/thumbnail.webp', '/media/8c9d8cca-b2e7-59fc-98fe-aea704848660/video.mp4', CAST('a2c02b8e-715f-5c60-aa1c-a86596001b4f' AS UUID), 2106649, 127241, CAST('2019-03-21T18:01:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), 'SCIENCE_AND_TECHNOLOGY'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND category = 'SCIENCE_AND_TECHNOLOGY') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('524aa9c6-74c0-57d2-895d-7915f402a052' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'QuantumFracture', 'IMPORTANTE: En hay un error 4:10. 40 toneladas son 40.000 kg, no 40.000.000. ¡Eso sería en gramos! ¡Disculpadme!


Y Uyuyuy, resulta que esta no será la última vez que me veáis mezclado con el Universo Marvel (estad atentos a mis redes sociales; viene algo gordo). En otro orden de cosas, la semana que viene tendréis una tremenda colaboración aquí en QF... 🎶+⚛', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4100
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('524aa9c6-74c0-57d2-895d-7915f402a052' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('16793a82-c133-56aa-b10a-7d24b8ef837d' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'novedad4468', 'Jaime Altozano??', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 27
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('16793a82-c133-56aa-b10a-7d24b8ef837d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6d928651-6dc2-50ee-a0d4-62c58841bbfd' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'angelar.r8614', ' @novedad4468  sii', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6d928651-6dc2-50ee-a0d4-62c58841bbfd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5eca7e31-9f7c-5c87-bea2-64a8416f5f5e' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'dragondelabismo8272', 'Jaime ya lo anunció por twitter xD', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 13
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5eca7e31-9f7c-5c87-bea2-64a8416f5f5e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cd7a22b4-6b3f-552f-a90e-50339629f121' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'lapinakawaii5010', '¡Ahora con peliculas de DC! :3', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 80
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cd7a22b4-6b3f-552f-a90e-50339629f121' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8c3e4b68-a911-52e9-a16e-cfe1d71530ee' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'klemo2529', ' @lapinakawaii5010 pero piña, mi diosa, que haces aquí aaaaaaaaaa', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8c3e4b68-a911-52e9-a16e-cfe1d71530ee' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c16acf84-db60-5c5e-8e26-2f94cd7b7a3b' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'elespitia', 'La Piña Kawaii soy el único que ve a la piña  en todas partes?', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c16acf84-db60-5c5e-8e26-2f94cd7b7a3b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bf66d47d-2f05-5d0b-9fc1-57548d40ef9f' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'B0rK9000', 'La Piña Kawaii Madre mia piña, que haces aqui compañera!', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bf66d47d-2f05-5d0b-9fc1-57548d40ef9f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9b35067c-12ae-52d5-a0d0-564e1a115cc1' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'potato_enjoyer4', 'Te apetece comentar 2001: una odisea espacial??? En serio, me encantaría que lo hicieras🤩🤩🤩', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 8
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9b35067c-12ae-52d5-a0d0-564e1a115cc1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('035604ac-a157-57fd-8b92-6d8609d61c87' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'PeridotArea51', 'Crespo te están robando las animaciones https://youtu.be/wko9mtbgavA', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 33
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('035604ac-a157-57fd-8b92-6d8609d61c87' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('253eb5c8-e11f-5723-b758-74e90e4904cb' AS UUID), CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID), NULL, 'unanonimmasdz5079', ' @PeridotArea51  Veo que lo usa como un recurso mas para su explicación, así que seria imposible que Crespo tome acciones de copyray ya que es un ser razonable xd', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('253eb5c8-e11f-5723-b758-74e90e4904cb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8c9d8cca-b2e7-59fc-98fe-aea704848660' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('8f2d734c-b1bb-5212-8bd1-b23e8d336198' AS UUID), 'seed-channel:8f2d734c-b1bb-5212-8bd1-b23e8d336198', '8f2d734c-b1bb-5212-8bd1-b23e8d336198@catalog.invalid', 'CienciaDeSofa', CAST('2018-10-28T19:50:19.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2018-10-28T19:50:19.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('8f2d734c-b1bb-5212-8bd1-b23e8d336198' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID), '¿Por qué los tomates se ven REPELIDOS por los imanes?', 'En el vídeo de hoy hablo de las dos propiedades que hacen que algunos materiales se vean atraídos por los imanes y otros se vean repelidos: el paramagnetismo y el diamagnetismo. Enlaces de interés:

Los libros de Ciencia de Sofá:

►El universo en una taza de café (https://goo.gl/Wqgdxw).

►Las 4 fuerzas que rigen el universo (https://goo.gl/wCT6np).

El blog de Ciencia de Sofá (www.cienciadesofa.com).

Enlaces para los imanes:

►https://amzn.to/2COqgIX
►https://amzn.to/2OWB275
►https://amzn.to/2SjUeK5

Música:

Beach Dayz - Lakey Inspired
Jazzadict''s Intro - Cosimo Fogg', 66, '/media/0e44765b-07cf-50fe-9c7f-29a338f8c2ee/thumbnail.webp', '/media/0e44765b-07cf-50fe-9c7f-29a338f8c2ee/video.mp4', CAST('8f2d734c-b1bb-5212-8bd1-b23e8d336198' AS UUID), 451298, 23265, CAST('2018-10-28T19:50:19.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID), 'SCIENCE_AND_TECHNOLOGY'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID) AND category = 'SCIENCE_AND_TECHNOLOGY') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('67b53c4f-3b66-54f6-82d6-b2044772c0b3' AS UUID), CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID), NULL, 'NéstorEduardoMelano', '8 años de este vídeo!!! Si ves este mensaje te mando un abrazo.', NULL, CAST('2026-09-23T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('67b53c4f-3b66-54f6-82d6-b2044772c0b3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b278168b-0569-5aec-9e09-549f46749afd' AS UUID), CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID), NULL, 'arteMirLusewix', 'Estabas deprimido cuando hiciste el vídeo? Te noté bajoneado.  Espero que sea el calor', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b278168b-0569-5aec-9e09-549f46749afd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('be943a7a-000a-5688-99d4-221350e42358' AS UUID), CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID), NULL, 'edwinpaez4777', '@CienciaDeSofa no crees que haya alguna relación de la gravedad y el electromagnetismo? Ya que los grandes cuerpos astrales tienen núcleos metálicos que giran y son los que no cuadran con las otras fuerzas a pesar de la Relatividad general', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('be943a7a-000a-5688-99d4-221350e42358' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0e44765b-07cf-50fe-9c7f-29a338f8c2ee' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('941d067f-ab7c-5056-90f0-ac1a00c0562c' AS UUID), 'seed-channel:941d067f-ab7c-5056-90f0-ac1a00c0562c', '941d067f-ab7c-5056-90f0-ac1a00c0562c@catalog.invalid', 'Bonnie Tyler', CAST('2015-09-14T23:47:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2015-09-14T23:47:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('941d067f-ab7c-5056-90f0-ac1a00c0562c' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID), 'Bonnie Tyler - Holding Out For A Hero (Official HD Video)', 'Official HD Video for "Holding Out For A Hero" by Bonnie Tyler 
Listen to Bonnie Tyler: https://bonnietyler.lnk.to/listenYD

Subscribe to the official Bonnie Tyler YouTube channel: https://BonnieTaylor.lnk.to/subscribeYD

Watch more Bonnie Tyler videos: https://bonnietyler.lnk.to/listenYD/youtube

Follow Bonnie Tyler:
Facebook: https://BonnieTyler.lnk.to/followFI
Instagram: https://BonnieTyler.lnk.to/followII
Twitter: https://BonnieTyler.lnk.to/followTI
Website: https://BonnieTyler.lnk.to/followWI
Spotify: https://BonnieTyler.lnk.to/followSI
YouTube: https://BonnieTaylor.lnk.to/subscribeYD

Chorus:
I need a hero
I''m holding out for a hero ''til the end of the night
He''s gotta be strong, and he''s gotta be fast
And he''s gotta be fresh from the fight
I need a hero
I''m holding out for a hero ''til the morning light
He''s gotta be sure, and it''s gotta be soon
And he''s gotta be larger than life
Larger than life

#BonnieTyler #HoldingOutForAHero #Footloose #OfficialMusicVideo #HD #Remastered', 29, '/media/66fd6ec4-7fcb-5b30-93fb-fea6317791b6/thumbnail.webp', '/media/66fd6ec4-7fcb-5b30-93fb-fea6317791b6/video.mp4', CAST('941d067f-ab7c-5056-90f0-ac1a00c0562c' AS UUID), 324723252, 2292982, CAST('2015-09-14T23:47:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('afcb92b0-46f8-55a3-afd3-5e66107cd478' AS UUID), CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID), NULL, 'yelitzayepez9222', 'Gracias  todas las mujeres tenemos un hereo❤', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('afcb92b0-46f8-55a3-afd3-5e66107cd478' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2351a48b-12a1-518c-b360-e9411f70cf64' AS UUID), CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID), NULL, 'Creeper-gx3jd', 'Bet nacional kkkkk', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2351a48b-12a1-518c-b360-e9411f70cf64' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('373e22b9-ac6d-5385-a8e3-8680118e8e43' AS UUID), CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID), NULL, 'herrampart', 'I''m playing this song on Marvels Guardians of the galaxy tonight we''re saving the galaxy and we''re dancjng while doing it! Its a Dance Off!', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('373e22b9-ac6d-5385-a8e3-8680118e8e43' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('66fd6ec4-7fcb-5b30-93fb-fea6317791b6' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('726e53b2-decf-52f3-9a50-4c78a6a7f3d4' AS UUID), 'seed-channel:726e53b2-decf-52f3-9a50-4c78a6a7f3d4', '726e53b2-decf-52f3-9a50-4c78a6a7f3d4@catalog.invalid', 'Roxette', CAST('2009-03-04T14:16:13.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-03-04T14:16:13.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('726e53b2-decf-52f3-9a50-4c78a6a7f3d4' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), 'Roxette - It Must Have Been Love (Official Music Video) (Remastered)', 'Official music video for Roxette - "It Must Have Been Love" from the movie ''Pretty Woman'' (1990)

Roxette - It Must Have Been Love
Directed by Doug Freel
Produced by Lisa Hollingshead
Official Video Remastered
Restored and edited from original 35 mm tapes by Thomas Ahlén, Fyra K Media 2026

Follow Roxettes Official Spotify Playlist:
https://open.spotify.com/playlist/5njHvoLZkaabXUDGXyg7LY?si=6de48b7c96174022 

Follow Roxette here:
https://www.tiktok.com/@roxetteofficial
https://www.instagram.com/realroxette/
https://www.facebook.com/RealRoxette 
https://open.spotify.com/artist/2SHhfs4BiDxGQ3oxqf0UHY?si=5ExCKFZfTZKVjU243sP4uA
https://music.apple.com/bh/artist/roxette/2397346

Lyrics:
It must have been love
But it''s over now

Lay a whisper on my pillow
Leave the winter on the ground
I wake up lonely, there''s air of silence
In the bedroom and all around

Touch me now, I close my eyes
And dream away

It must have been love
But it''s over now
It must have been good
But I lost it somehow
It must have been love
But it''s over now
From the moment we touched
''Til the time had run out

Make-believing we''re together
That I''m sheltered by your heart
But in and outside I''ve turned to water
Like a teardrop in your palm

And it''s a hard winter''s day
I dream away

It must have been love (must have been love)
But it''s over now (but it''s over now)
It was all that I wanted
Now I''m living without
It must have been love (it must have been love)
But it''s over now

It''s where the water flows
It''s where the wind blows

It must have been love (must have been love)
But it''s over now (but it''s over now)
It must have been good
But I lost it somehow
It must have been love (must have been love)
But it''s over now (but it''s over now)
From the moment we touched
''Til the time had run out

Yeah, it must have been love (must have been love)
But it''s over now (but it''s over now)
It was all that I wanted
Now I''m living without
It must have been love
But it''s over now

It''s where the water flows
It''s where the wind blows

Oh-oh (must have been love)
But it''s over now (but it''s over now), now
It must have been love (it must have been love)
But it''s over now (but it''s over now), now', 21, '/media/52db23df-bc38-5647-98f1-e2df1dd4460f/thumbnail.webp', '/media/52db23df-bc38-5647-98f1-e2df1dd4460f/video.mp4', CAST('726e53b2-decf-52f3-9a50-4c78a6a7f3d4' AS UUID), 1043112698, 4095076, CAST('2009-03-04T14:16:13.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3161f8c2-4902-5962-a183-ad1bbbc912a5' AS UUID), CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), NULL, 'ChiefRickyRC', 'Auntie Slayer song 

Ricky W/H 2026', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3161f8c2-4902-5962-a183-ad1bbbc912a5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('68b05a5d-bb85-5ccc-b28a-d9e53e3b4aa4' AS UUID), CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), NULL, 'tapanim6576', 'Upeeta. 💙 Härligt. 💛 Awesome. ❤', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('68b05a5d-bb85-5ccc-b28a-d9e53e3b4aa4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('99d82475-57ec-5f4b-a6c4-0daca007ab42' AS UUID), CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), NULL, 'pasqualefusco3577', '2.52 guitar 😉', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('99d82475-57ec-5f4b-a6c4-0daca007ab42' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ec321ced-19a6-5b33-ac8e-b62efcc15840' AS UUID), CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), NULL, 'Levisemsono', 'Obrigado, pai por me fazer conhecer essa musica', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ec321ced-19a6-5b33-ac8e-b62efcc15840' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b5c848a3-d322-551c-a6b0-ce2887ef3622' AS UUID), CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), NULL, 'aikjones1', 'where did 25years goo!!!!! Listened to this in my teens', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b5c848a3-d322-551c-a6b0-ce2887ef3622' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8ceeccb4-9abf-5534-ac32-52e271970c64' AS UUID), CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), NULL, 'vivaldahenriqueszenza', 'O corpo morre, mais os nossos feitos viverão para sempre.
Nunca serás esquecida,as tuas músicas são terapias para a alma 🙏', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8ceeccb4-9abf-5534-ac32-52e271970c64' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3e3c14cd-65f0-5364-893d-5375c744cc8f' AS UUID), CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID), NULL, 'vivaldahenriqueszenza', 'Nunca consegui encontrar essa música porque não sabia o título em inglês, mais essa melodia estava sempre na minha mente, hoje finalmente consegui, estou muito feliz.
Obrigada YouTube', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3e3c14cd-65f0-5364-893d-5375c744cc8f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('52db23df-bc38-5647-98f1-e2df1dd4460f' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('8d31c1e5-b9e6-586a-b5b6-6ba0b6287a93' AS UUID), 'seed-channel:8d31c1e5-b9e6-586a-b5b6-6ba0b6287a93', '8d31c1e5-b9e6-586a-b5b6-6ba0b6287a93@catalog.invalid', 'a-ha', CAST('2010-01-06T17:58:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2010-01-06T17:58:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('8d31c1e5-b9e6-586a-b5b6-6ba0b6287a93' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID), 'a-ha - Take On Me (Official Video) [4K]', '“Take On Me” has been remastered in stunning 4K resolution - watch it now! 📺 Watch all the official a-ha videos here http://bit.ly/ahaOfficialVideos

ONE BILLION VIEWS on February 17, 2020 / TWO BILLION VIEWS on September 19, 2024 📅

🎼 Listen to more a-ha here https://lnk.to/ahastrm

🔔 Subscribe to the a-ha channel and “ring the bell” to turn on notifications http://bit.ly/Subscribetoaha

At the 1986 MTV Video Music Awards, the video for "Take On Me" won six awards—Best New Artist in a Video, Best Concept Video, Most Experimental Video, Best Direction, Best Special Effects, and Viewer''s Choice—and was nominated for two others, Best Group Video and Video of the Year. "Take On Me" was also nominated for Favorite Pop/Rock Video at the 13th American Music Awards in 1986.

Time and Again: The Ultimate a-ha, including the biggest hits + rare and unreleased remixes, is out now! Get your copy here: http://smarturl.it/ahatimeagaincd

Stay In Touch with a-ha…

📡 Website https://a-ha.com/
🌎 Tour Dates https://a-ha.com/tickets
📣 Facebook https://www.facebook.com/officialaha/
📸 Instagram https://www.instagram.com/officialaha/
📱 Twitter https://twitter.com/aha_com
🔈 Soundcloud https://soundcloud.com/a-ha

Stay In Touch with Morten Harket…

📡 Website https://mortenharket.com/
📣 Facebook https://www.facebook.com/mortenharket.official/
📸 Instagram https://www.instagram.com/mortenharket/
📱 Twitter https://twitter.com/mortenharket

*******************

The a-ha channel is the official YouTube home of the Norwegian Pop trio a-ha, who achieved global stardom in 1985 when their debut single, “Take On Me” from the album ‘Hunting High And Low’ topped the charts in 36 different countries on its way to becoming one of the best-selling singles of all time, and the 5th most streamed song of the 20th century. a-ha struck chart gold again with “The Sun Always Shines On T.V.” and “Cry Wolf,” and recorded the theme to the 1987 James Bond film “The Living Daylights”. The a-ha YouTube channel is proud to host the music videos from these hits alongside live performance videos, lyric videos, and the solo work of band members Morten Harket (lead vocals), Paul Waaktaar-Savoy (Guitar), and Magne Furuholmen (Keyboards).', 28, '/media/dc702a21-bd74-56da-9ab8-8032ec262322/thumbnail.webp', '/media/dc702a21-bd74-56da-9ab8-8032ec262322/video.mp4', CAST('8d31c1e5-b9e6-586a-b5b6-6ba0b6287a93' AS UUID), 2503282295, 13069016, CAST('2010-01-06T17:58:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('622afab6-24b6-5d7f-8da2-2f53c790e3d0' AS UUID), CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID), NULL, 'aha', 'ONE BILLION VIEWS!!! 🎉 Celebrate with us by checking out the a-ha capsule collection http://lnk.to/Take-On-Me-1-Billion 🎉', NULL, CAST('2020-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 191000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('622afab6-24b6-5d7f-8da2-2f53c790e3d0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5cd55c54-2d0a-53cb-b553-e30a7fb1810c' AS UUID), CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID), NULL, 'zoemiavalderrabanomendez6286', 'Que bien por fin triunfan la mejor canción .Saludos desde México 🇲🇽', NULL, CAST('2020-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 9
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5cd55c54-2d0a-53cb-b553-e30a7fb1810c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2c911fe9-aea1-56a0-bea8-0e1efab3cb59' AS UUID), CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID), NULL, 'ShockInazuma', 'Oh look at that I am last', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 8
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2c911fe9-aea1-56a0-bea8-0e1efab3cb59' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f074522b-0d28-503e-8373-40176b36b4a2' AS UUID), CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID), NULL, 'kostaskatsaras1111', 'Μπράβο ρε!', NULL, CAST('2020-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f074522b-0d28-503e-8373-40176b36b4a2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0b80dd3c-7b5d-5be1-891d-481328a3ba59' AS UUID), CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID), NULL, 'neribragajr1561', '1.000.000.000.000
Eu faço parte desta história.
Parabéns A-HA.', NULL, CAST('2020-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 33
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0b80dd3c-7b5d-5be1-891d-481328a3ba59' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc702a21-bd74-56da-9ab8-8032ec262322' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('5defebf4-e0d6-5113-83ab-0b49e32b67ec' AS UUID), 'seed-channel:5defebf4-e0d6-5113-83ab-0b49e32b67ec', '5defebf4-e0d6-5113-83ab-0b49e32b67ec@catalog.invalid', 'Scorpions', CAST('2009-11-01T09:42:41.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-11-01T09:42:41.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('5defebf4-e0d6-5113-83ab-0b49e32b67ec' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), 'Scorpions - Wind Of Change (Official Music Video)', 'REMASTERED IN HD!

Official Music Video for Wind Of Change performed by Scorpions.



Listen to our new album "Rock Believer" https://scorpions.lnk.to/RockBeliever



Best of Scorpions: https://goo.gl/dtfDmo

Subscribe here: https://goo.gl/jQbFpy



Follow Scorpions 

Instagram: https://www.instagram.com/scorpions

Twitter: https://twitter.com/scorpions

Facebook: https://www.facebook.com/Scorpions

Website: https://www.the-scorpions.com



(C) 1991 The Island Def Jam Music Group



#Scorpions #WindOfChange #Remastered', 38, '/media/aa4d8968-521e-55ae-9b8e-cab024a8d1ac/thumbnail.webp', '/media/aa4d8968-521e-55ae-9b8e-cab024a8d1ac/video.mp4', CAST('5defebf4-e0d6-5113-83ab-0b49e32b67ec' AS UUID), 1249296769, 6052852, CAST('2009-11-01T09:42:41.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e4aeb3f4-27d1-58fd-8a4c-f53b96bedcbc' AS UUID), CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), NULL, 'KanikaPov-l9y', '❤❤❤❤❤❤‍🩹❤‍🩹❤‍🩹❤‍🩹', NULL, CAST('2026-09-30T10:33:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e4aeb3f4-27d1-58fd-8a4c-f53b96bedcbc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('392026b4-9e2d-5757-afca-ea5a95cc7553' AS UUID), CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), NULL, 'i.magdalena', 'gdyby powstawało więcej tak cudownych  ideowych pieśni może mocarze światowi poczuliby że mają serca??
brawo Skorpiony !!!!!!!!!!!!!!!!!!!!', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('392026b4-9e2d-5757-afca-ea5a95cc7553' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('87dc37f9-8eca-53cc-9541-90bc19dbd212' AS UUID), CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), NULL, 'WarindaJaitang', 'A❤', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('87dc37f9-8eca-53cc-9541-90bc19dbd212' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3459b611-ae99-537d-852b-8b7b39fa1c00' AS UUID), CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), NULL, 'WarindaJaitang', 'ไอเลิฟยู❤😊', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3459b611-ae99-537d-852b-8b7b39fa1c00' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1c8214d3-e02c-5779-9544-6d46908e7962' AS UUID), CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), NULL, 'nddocorte00', 'Que pena não ter te conhecido pai, mesmo assim sinto muita a sua falta!', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1c8214d3-e02c-5779-9544-6d46908e7962' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e7241a63-ced2-5759-abf6-67dcafa84882' AS UUID), CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), NULL, 'stan8492', 'Beautiful song for the human race, I do hope the younger generations can appreciate it.', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e7241a63-ced2-5759-abf6-67dcafa84882' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7b780815-9731-50ea-8d63-856b4e1a3ba6' AS UUID), CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), NULL, 'alinurdiansyah351', 'from pemalang java,indonesia', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7b780815-9731-50ea-8d63-856b4e1a3ba6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('85c08591-e51a-5e83-877f-556ed130dfec' AS UUID), CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID), NULL, 'eddieweyer3535', 'We need peace', NULL, CAST('2026-09-29T23:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('85c08591-e51a-5e83-877f-556ed130dfec' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('aa4d8968-521e-55ae-9b8e-cab024a8d1ac' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('91226de1-5944-57b7-b06f-fdf65b500d21' AS UUID), 'seed-channel:91226de1-5944-57b7-b06f-fdf65b500d21', '91226de1-5944-57b7-b06f-fdf65b500d21@catalog.invalid', 'LP', CAST('2016-01-12T21:04:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2016-01-12T21:04:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('91226de1-5944-57b7-b06f-fdf65b500d21' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID), 'LP - Lost On You (Live)', 'Listen to the album ''Love Lines'': https://lp.lnk.to/LoveLinesID

Watch more from ‘Love Lines’: https://www.youtube.com/playlist?list=PLyv7j-kfoPR8n4U5lruf2RbWDXsLmFUek 

Pre-Order Limited Edition Vinyl: https://iamlp.rosecityworks.com/

New album ''Heart To Mouth" out now: https://lp.lnk.to/HeartToMouthID 


Lost On You: http://smarturl.it/LostOnYouAlbum

Lyrics:

When you get older, plainer, saner
Will you remember all the danger
We came from?
Burnin'' like embers, falling tender
Long before the days of no surrender years ago
And well you know?

So smoke ''em if you got ''em
''cause it''s going down
All I ever wanted was you
I''ll never get to heaven
''cause I don''t know how

Let''s raise a glass or two
To all the things I''ve lost on you, oh-oh
Tell me are they lost on you? Oh-oh
Just that you could cut me loose, oh-oh
After everything I''ve lost on you
Is that lost on you?
Oh-oh-oh-oh-oh, oh, oh-oh
Oh-oh-oh-oh-oh
Is that lost on you?
Oh-oh-oh-oh-oh, oh, oh-oh
Baby, is that lost on you?
Is that lost on you?

Wish that I could see the machinations
Understand the toil of expectations in your mind
Hold me like you never lost your patience
Tell me that you love me more than hate me
All the time
And you''re still mine

So smoke ''em if you got ''em
''cause it''s going down
All I ever wanted was you
Let''s take a drink of heaven
This can turn around

Let''s raise a glass or two
To all the things I''ve lost on you, oh-oh
Tell me are they lost on you? Oh-oh
Just that you could cut me loose, oh-oh
After everything I''ve lost on you
Is that lost on you?
Oh-oh-oh-oh-oh, oh, oh-oh
Oh-oh-oh-oh-oh
Is that lost on you?
Oh-oh-oh-oh-oh, oh, oh-oh
Baby, is that lost on you?
Is that lost on you?

Lost on you
Lost on you

Let''s raise a glass or two
To all the things I''ve lost on you, oh-oh
Tell me are they lost on you? Oh-oh
Just that you could cut me loose, oh-oh
After everything I''ve lost on you
Is that lost on you?
Is that lost on you?
----------------------------------

Website: http://iamlp.com
Facebook: http://facebook.com/iamLP
Twitter: http://twitter.com/iamlp
Soundcloud: https://soundcloud.com/iamlpmusic', 25, '/media/50e333da-928a-5916-862d-7b76b2b3049c/thumbnail.webp', '/media/50e333da-928a-5916-862d-7b76b2b3049c/video.mp4', CAST('91226de1-5944-57b7-b06f-fdf65b500d21' AS UUID), 1692638359, 7636220, CAST('2016-01-12T21:04:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ab2831b3-d41b-57df-b668-9f09529039ad' AS UUID), CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID), NULL, 'iamlpofficial', 'Watch the video for LP’s latest single “Golden” here: https://www.youtube.com/watch?v=whwMBPc1EBE', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 12000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ab2831b3-d41b-57df-b668-9f09529039ad' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bd436e3f-d200-5163-b755-027d66193c7e' AS UUID), CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID), NULL, 'ricardopereira5024', 'Amo', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 18
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bd436e3f-d200-5163-b755-027d66193c7e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8b3074dc-9c6f-5596-ac3f-8fe80747ea02' AS UUID), CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID), NULL, 'carloscollazo1089', 'Uruguay existe también!!!!!', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 33
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8b3074dc-9c6f-5596-ac3f-8fe80747ea02' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1e2e4db4-b773-56a1-8e45-8f84ce0d988a' AS UUID), CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID), NULL, 'nathaliepoisson1251', 'L', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1e2e4db4-b773-56a1-8e45-8f84ce0d988a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6eb8293d-2d08-5b82-b205-c67bb48cfc14' AS UUID), CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID), NULL, 'maradill9250', 'Amei❤🎉', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6eb8293d-2d08-5b82-b205-c67bb48cfc14' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('50e333da-928a-5916-862d-7b76b2b3049c' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('fdaf5f9c-1bc2-59df-a445-e4cd9cce1d2a' AS UUID), 'seed-channel:fdaf5f9c-1bc2-59df-a445-e4cd9cce1d2a', 'fdaf5f9c-1bc2-59df-a445-e4cd9cce1d2a@catalog.invalid', 'Evanescence', CAST('2009-12-02T09:48:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-12-02T09:48:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('fdaf5f9c-1bc2-59df-a445-e4cd9cce1d2a' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), 'Evanescence - My Immortal (Official HD Music Video)', 'Official HD music video for “My Immortal,” taken from the band’s multi-platinum debut Fallen.

Evanescence are celebrating the 20th anniversary of Fallen with a series of special reissues via Craft Recordings. 

Details/order: https://found.ee/fallen20 

Available on Deluxe 2-LP, 2-CD, and Digital — as well as a Super Deluxe Edition collector’s box set — Fallen (20th Anniversary Edition) offers newly remastered audio, including the album’s singles “My Immortal,” “Going Under,” “Everybody’s Fool,” and “Bring Me To Life.” The expanded set also includes a trove of bonus material – ten tracks in all – comprising previously-unreleased demos and live recordings plus a selection of rare B-sides. Alongside reimagined artwork, all physical formats will include previously-unseen photos from the era, plus a handwritten foreword by Amy Lee, who oversaw all aspects of the reissue. The Deluxe vinyl, CD and digital configurations are out now. 

Available exclusively at Evanescence.com is the Super Deluxe Box Set, arriving February, 2024. Housed in a collectible shadow box-style package (inspired by Amy’s songwriting journal cover art), this limited edition includes all of the above-mentioned music as part of a 2-LP set (featuring a Black & Silver blend vinyl) plus a bonus cassette of previously unreleased demos and voice notes which is exclusive to this box set. Adding additional insight into the album is an expansive book which features new track-by-track notes from Lee, while a zoetropic turntable slipmat, rare photo prints, and enamel pin set round out the collection.  

Subscribe to Evanescence on YouTube: http://bit.ly/2vTSZWt
Official Evanescence Website: http://www.evanescence.com
Like Evanescence on Facebook: https://www.facebook.com/Evanescence
Follow Evanescence on Twitter: https://twitter.com/Evanescence
Follow Evanescence on Instagram: https://www.instagram.com/EvanescenceOfficial
Listen to Evanescence on Spotify: https://open.spotify.com/artist/5nGIFgo0shDenQYSE0Sn7c
Listen to Evanescence on Apple Music: http://apple.co/2kB2JDO

#Evanescence #MyImmortal #Vevo #Rock #OfficialMusicVideo #HDVideo

Music video by Evanescence performing My Immortal. (C) 2004 Wind-Up Records, LLC', 65, '/media/488acfcb-f644-5fb7-b434-433b05f1dbfa/thumbnail.webp', '/media/488acfcb-f644-5fb7-b434-433b05f1dbfa/video.mp4', CAST('fdaf5f9c-1bc2-59df-a445-e4cd9cce1d2a' AS UUID), 1123623906, 6298686, CAST('2009-12-02T09:48:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4aeaa55c-9066-5eb6-86b5-dd25408531c0' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'caitlinsimpson4538', 'Depression is so hard', NULL, CAST('2026-09-30T09:54:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4aeaa55c-9066-5eb6-86b5-dd25408531c0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6a02c9ec-da45-59de-8669-4926cd1f8794' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'biskukuy', 'Desde hace unos años me he sentido tan lejos de todo el mundo, estar rodeado de gente te y tan solo. T.T', NULL, CAST('2026-09-30T09:51:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6a02c9ec-da45-59de-8669-4926cd1f8794' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b3e4b8fb-c909-55cb-b2e0-9494829c94cb' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'VOLYNSKIYY', '2026,hi', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b3e4b8fb-c909-55cb-b2e0-9494829c94cb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('824cdb96-2623-5926-b83c-3cc16082bf9c' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'crashspyrofan98', 'My dad died from a heart attack on August 17 2022 at age 57', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('824cdb96-2623-5926-b83c-3cc16082bf9c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('62a46caa-7e3a-5441-80b9-891464bfa463' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'andrewfox1675', 'Terrifying. Beautiful. How can a song be both? Amy Lee proves it can be done.', NULL, CAST('2026-09-30T06:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('62a46caa-7e3a-5441-80b9-891464bfa463' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b6161e4a-a427-51bb-83e7-70bb28017d77' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'Dark-silvia15', 'Какой красивый и сильный голос🥰', NULL, CAST('2026-09-30T06:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b6161e4a-a427-51bb-83e7-70bb28017d77' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d90e8f15-ea3a-580a-a59f-e5ede10ca55c' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'pdoyle9854', 'We no bowllimg in that wan', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d90e8f15-ea3a-580a-a59f-e5ede10ca55c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5b29f41b-aa25-5783-8a87-d8b5a25e3695' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'MS08052', 'This is for you JJD, you will always part of my life , I love your family . Inspite of what happen to us maybe we are not destined for each other , your family loves me , I saw him at Hampton if I’m not mistaken ,  you are all protective to me . I was at work I can’t do anything . . You always take care .  Be good and have longer patience . I love you all too like family . ❤️💕❤️🇺🇸❤️💕❤️', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5b29f41b-aa25-5783-8a87-d8b5a25e3695' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5161c8f9-8ad0-53a5-b1a0-108441b3b447' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'jahlydsilver8907', 'Eu  amava esses dois minha malhada favorita ❤❤❤', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5161c8f9-8ad0-53a5-b1a0-108441b3b447' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d3b623b5-5a77-51db-87b0-c364c83426d7' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'thyllium', 'L''ultimo biscotto......', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d3b623b5-5a77-51db-87b0-c364c83426d7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6d8e4734-9c97-56f6-9008-429c405b1be7' AS UUID), CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID), NULL, 'fzfz537', 'September 2026', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6d8e4734-9c97-56f6-9008-429c405b1be7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('488acfcb-f644-5fb7-b434-433b05f1dbfa' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('098a010d-ce9a-57f0-b334-0445e268b47c' AS UUID), 'seed-channel:098a010d-ce9a-57f0-b334-0445e268b47c', '098a010d-ce9a-57f0-b334-0445e268b47c@catalog.invalid', 'Cher', CAST('2018-10-19T17:00:08.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2018-10-19T17:00:08.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('098a010d-ce9a-57f0-b334-0445e268b47c' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), 'Cher - Believe (Official Music Video) [4K Remaster]', 'The official 4k remastered music video for Believe from Cher''s 1998 album ''Believe.'' *Believe (25th Anniversary Deluxe Edition)* boxed set includes the timeless classics plus electrifying remixes from the era compiled together for the first time on 3LP, 2CD & digitally. The limited-edition 3LP boxed set features the album on colored vinyl (clear, sea blue & light blue), and also contains an exclusive numbered lithograph. 

Out now: https://Cher.lnk.to/Believe25 

Follow Cher: 
⋆  Instagram: https://www.instagram.com/cher 
⋆  Tiktok: https://tiktok.com/@cher   
⋆  Twitter: https://x.com/cher   
⋆  Facebook: https://www.facebook.com/cher  
⋆  Official website: https://www.cher.com/#!/ 

Listen to Cher: https://lnk.to/listentocher 

Subscribe to Cher on YouTube and “ring the bell” to never miss a notification: https://www.youtube.com/channel/UCmoUgBTHRydApyOeqlDF1oQ?sub_confirmation=1 

Shop official merch, music and more at https://cher.store/ 

#cher #believe #Believe25', 26, '/media/d9154f2d-ebbe-5375-97b0-8dd4b0a6c392/thumbnail.webp', '/media/d9154f2d-ebbe-5375-97b0-8dd4b0a6c392/video.mp4', CAST('098a010d-ce9a-57f0-b334-0445e268b47c' AS UUID), 475107107, 2765760, CAST('2018-10-19T17:00:08.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('da22dfd8-ded8-5076-9be4-eb4c5d72f979' AS UUID), CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), NULL, 'badname8501', 'Idk why people wanna cut their hair so they don’t look like Cher…She has great long hair! 🫶👍', NULL, CAST('2026-09-30T10:13:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('da22dfd8-ded8-5076-9be4-eb4c5d72f979' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2028d190-b87b-5a00-a0db-4c9de5c031c3' AS UUID), CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), NULL, 'alekssel6594', 'Как всегда прекрасна!', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2028d190-b87b-5a00-a0db-4c9de5c031c3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5988c570-ac0c-5e46-aa4f-6ba73e432f1b' AS UUID), CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), NULL, 'M_o_m_o', 'No puede Cher... 🗣️🗣️🗣️', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5988c570-ac0c-5e46-aa4f-6ba73e432f1b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c45c5426-1dc2-5f2f-b1b0-79f1ab436697' AS UUID), CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), NULL, 'саша2011-ъ4ю', 'ladno ............', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c45c5426-1dc2-5f2f-b1b0-79f1ab436697' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9d13827f-9a68-58f3-9710-20c640a36a79' AS UUID), CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), NULL, 'саша2011-ъ4ю', 'ne verui', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9d13827f-9a68-58f3-9710-20c640a36a79' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7ab9606c-578c-5aac-89fb-1ff53bbdc148' AS UUID), CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), NULL, 'саша2011-ъ4ю', 'nado rabotat', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7ab9606c-578c-5aac-89fb-1ff53bbdc148' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9c618123-36ae-5055-9a07-60d9bf1aa98a' AS UUID), CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID), NULL, 'саша2011-ъ4ю', 'mogesh lychshe', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9c618123-36ae-5055-9a07-60d9bf1aa98a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d9154f2d-ebbe-5375-97b0-8dd4b0a6c392' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('89783cee-8587-539f-8b52-98877b921b2f' AS UUID), 'seed-channel:89783cee-8587-539f-8b52-98877b921b2f', '89783cee-8587-539f-8b52-98877b921b2f@catalog.invalid', 'TheCranberriesTV', CAST('2009-06-16T22:23:31.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-06-16T22:23:31.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('89783cee-8587-539f-8b52-98877b921b2f' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), 'The Cranberries - Zombie (Alt. Version)', 'Official Music Video for Zombie (Alt. Version) by The Cranberries.

Listen to The Cranberries here - https://TheCranberries.lnk.to/Stream

Discover more about The Cranberries:
Facebook - https://TheCranberries.lnk.to/Facebook
Twitter - https://TheCranberries.lnk.to/Twitter
Instagram - https://TheCranberries.lnk.to/Instagram
Website - https://TheCranberries.lnk.to/Website

Sign up for the email list - https://TheCranberries.lnk.to/Email

More videos from The Cranberries - https://TheCranberries.lnk.to/YouTube 

#NoNeedToArgue #TheCranberries 

(C) 1994 The Island Def Jam Music Group', 33, '/media/79d9be33-d8f8-53f7-941b-3be72c5988c4/thumbnail.webp', '/media/79d9be33-d8f8-53f7-941b-3be72c5988c4/video.mp4', CAST('89783cee-8587-539f-8b52-98877b921b2f' AS UUID), 188035701, 963484, CAST('2009-06-16T22:23:31.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b9a880ed-d3dd-5077-9b41-e72e7c731903' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'lucascampo9062', 'Fuck the crown 🇦🇷😊', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b9a880ed-d3dd-5077-9b41-e72e7c731903' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d6b919c1-6846-5729-bebe-6fce762ee2f0' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'I_Am_Infamy', '"They have nothing in their whole imperial arsenal that can break the spirit of one Irishman who doesn''t want to be broken." 
-Bobby Sands: 1954-1981
Poet.
Patriot.
Freedom Fighter.
Member of Paliament.
Murdered by a unjust regime.', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d6b919c1-6846-5729-bebe-6fce762ee2f0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('90c43a95-47a8-577f-bcca-0fb1041c48fb' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'uetom3219', 'Vengo por nene royal', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('90c43a95-47a8-577f-bcca-0fb1041c48fb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('327c3177-d66d-5481-9c6c-89ff5ac35986' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'JoyceBurns-cx2nr', 'Respect 🙏 I quit dancing for the Irish conclave when I was in my 20s😢 I knew that money supported th IRA😢😢😢😢', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('327c3177-d66d-5481-9c6c-89ff5ac35986' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2b010fd8-6edb-5feb-9311-7d66ac771475' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'kostakj', 'Lei rimarrà Immortale con questa canzone!', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2b010fd8-6edb-5feb-9311-7d66ac771475' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4bfae7b8-96c5-5919-8ee5-aa0b2c078e00' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'Thecodedecho', 'Here after Nene from Phuket in 2026!!!', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4bfae7b8-96c5-5919-8ee5-aa0b2c078e00' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('73b5d9b5-a1d6-5f96-9100-1a5947fa0792' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'goldkrone_tester', 'jesus christ', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('73b5d9b5-a1d6-5f96-9100-1a5947fa0792' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8eeb06d9-c0cd-5dae-a7f8-be97fcc19954' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'DawnFlood', 'Absolute best music of the 90s utra', NULL, CAST('2026-09-29T17:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8eeb06d9-c0cd-5dae-a7f8-be97fcc19954' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('eb5c0697-999f-5c0d-83fd-44030eb9f73e' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'RedmiMi-k6t', 'I thinking about Crocodile swamp and the hunter in Snow white update Sept 2026；', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('eb5c0697-999f-5c0d-83fd-44030eb9f73e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('debeac14-c9cd-541b-b74c-315c44bc59f3' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'jessicahall9119', 'This could not be more relevant than it is today.', NULL, CAST('2026-09-29T15:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('debeac14-c9cd-541b-b74c-315c44bc59f3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('33d2c3c3-dc95-5020-83b8-7c42c70a0e0e' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'golbalhelmut8442', 'To me, “Zombie” voiced an uncomfortable truth: violence was stripping people on both sides of their humanity. How do you face what you’ve become when admitting it feels like losing face?

A timeless cry for peace. Emotional. Legendary.

May no mother’s heart ever break again because another life was taken.

RIP Dolores O’Riordan.
You gave that pain your voice. It still echoes. ☮️', NULL, CAST('2026-09-29T13:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('33d2c3c3-dc95-5020-83b8-7c42c70a0e0e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f1e872e8-6412-5a7b-bdbf-15c996eaa410' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'cianetti1', 'Cara, piccola, riposa in pace!', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f1e872e8-6412-5a7b-bdbf-15c996eaa410' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8945efcf-92c1-5d35-8bd5-a6cc51d6f969' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'ben2846-c4s', 'mythique... génial.... éternelle chanson 🤩😍', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8945efcf-92c1-5d35-8bd5-a6cc51d6f969' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('38ac7253-519c-55d4-bc4c-6e1816b5ca32' AS UUID), CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID), NULL, 'bernie_munoz', 'This is just right !!! I felt my generation!! Children’s are dying and I can’t do anything!! Im sorry!! I’m SORRY !! I not strong enough.', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('38ac7253-519c-55d4-bc4c-6e1816b5ca32' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('79d9be33-d8f8-53f7-941b-3be72c5988c4' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('fe7bfd3c-1afd-5d4a-8b5c-9605a99fe8ed' AS UUID), 'seed-channel:fe7bfd3c-1afd-5d4a-8b5c-9605a99fe8ed', 'fe7bfd3c-1afd-5d4a-8b5c-9605a99fe8ed@catalog.invalid', 'Metallica', CAST('2009-10-27T01:57:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-10-27T01:57:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('fe7bfd3c-1afd-5d4a-8b5c-9605a99fe8ed' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), 'Metallica: Nothing Else Matters (Official Music Video)', 'Metallica''s official music video for “Nothing Else Matters,” from the album “Metallica.” Subscribe for more videos: https://metallica.lnk.to/subscribe

Listen to Metallica: https://metallica.lnk.to/listen
Directed by Adam Dubin
Filmed during the recording of The Black Album in Spring 1991 in North Hollywood, CA

Video Premiere Date: February 25, 1992

Follow Metallica:
Website & Store: http://www.metallica.com
Official Live Recordings: http://www.livemetallica.com
Instagram: http://www.instagram.com/metallica
Facebook: http://www.facebook.com/metallica
Twitter: http://www.twitter.com/metallica

© 1992 Blackened Recordings

#Metallica #TheBlackAlbum', 21, '/media/b982af7a-ce27-5cbe-8201-992649b7cfa0/thumbnail.webp', '/media/b982af7a-ce27-5cbe-8201-992649b7cfa0/video.mp4', CAST('fe7bfd3c-1afd-5d4a-8b5c-9605a99fe8ed' AS UUID), 1689751736, 7133075, CAST('2009-10-27T01:57:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c95f367a-a206-5286-94db-1b0f794488f3' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'RebeccaGarcia-jx9jl', 'Touchdown', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c95f367a-a206-5286-94db-1b0f794488f3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9e524f38-3fd8-5330-a5f9-15e44ef3692f' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'RebeccaGarcia-jx9jl', 'Thank you', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9e524f38-3fd8-5330-a5f9-15e44ef3692f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9f210ddb-599e-5f06-8427-c46c034c4fd9' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'samhianblackmoon', 'Forget us never', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9f210ddb-599e-5f06-8427-c46c034c4fd9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a97f4c98-48c8-58c9-897b-9de4d022453c' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'FoalsForever2008', 'it is 6 and a half minutes, still not long enough', NULL, CAST('2026-09-29T22:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a97f4c98-48c8-58c9-897b-9de4d022453c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7431f97d-bbdd-59b7-8e1f-01258e2c51fc' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'jackiekobiela-wittenkeller3062', 'This is by far the best rock ballad and true to life for me! I  can listen over and over.  I  still get  some of the words wrong,  lol!', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7431f97d-bbdd-59b7-8e1f-01258e2c51fc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9b27e044-3cb6-577a-abb9-c3b1d444e421' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'N.N-u1e', '2026🤘🏼👏🏼👏🏼👏🏼', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9b27e044-3cb6-577a-abb9-c3b1d444e421' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('422da455-13a0-52cb-b835-4dca98efc9d9' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'PedroSmith-pk4ld', 'The music is berry goog', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('422da455-13a0-52cb-b835-4dca98efc9d9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('35d9a49a-19e3-5b2b-b417-51051c0e800f' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'NargesKhavari-fk5mh', 'Really I need to hear this  today ❤️‍🩹', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('35d9a49a-19e3-5b2b-b417-51051c0e800f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('75d08a98-2eed-5ba1-9ba6-815cad8a55be' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'דוידגורכוהל', 'אין כמו אימא בעולם האמת!!!!——-רק אימא מביאה ילדים לעולם!!! ———ילדים לא נולדים בשמיים!!!—— בשמיים אין אבא!! אין ניסים!!! אין אלוהים!!!!——כל אנשי הדת נוכלים!! רמאים!!! מטעים להאמין באמונות תפלות לתועלתם האישית!!!!! יש אמת אחת!!! עובדתית!!!! אימא !!!! אין כמו אימא בעולם האמת!!!!! 5:07', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('75d08a98-2eed-5ba1-9ba6-815cad8a55be' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f9bb4064-2556-5a3b-a0d8-d6b1ae3aa553' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'thediddler', '2026!', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f9bb4064-2556-5a3b-a0d8-d6b1ae3aa553' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('26ed3440-7838-580f-862b-8d8bf8f62963' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'amyb4751', 'I always come back......❤', NULL, CAST('2026-09-29T19:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('26ed3440-7838-580f-862b-8d8bf8f62963' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8543e8af-5224-5660-9493-4c84ff3b8182' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'Bars-1967', 'Не песня....Бомба!!!!!!!!!!  Музыка....отпад....!!!', NULL, CAST('2026-09-29T19:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8543e8af-5224-5660-9493-4c84ff3b8182' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1550a416-3c08-5fb9-b818-6f777ad0ae0a' AS UUID), CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID), NULL, 'phoenixtieneti2465', 'He dejado a la chica que más quería por mis problemas mentales, si alguna vez ves esto que sepas que siempre te querré', NULL, CAST('2026-09-29T18:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1550a416-3c08-5fb9-b818-6f777ad0ae0a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b982af7a-ce27-5cbe-8201-992649b7cfa0' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('194ee690-0136-5a6f-9a26-94baa21c0b80' AS UUID), 'seed-channel:194ee690-0136-5a6f-9a26-94baa21c0b80', '194ee690-0136-5a6f-9a26-94baa21c0b80@catalog.invalid', 'Taylor Swift', CAST('2014-08-18T21:18:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2014-08-18T21:18:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('194ee690-0136-5a6f-9a26-94baa21c0b80' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID), 'Taylor Swift - Shake It Off', 'Music video by Taylor Swift performing Shake It Off. (C) 2014 Taylor Swift.

Stream/download ‘The Life of a Showgirl’ - https://taylor.lnk.to/TSTheLifeofaShowgirlYD

►Shop Merch: http://taylor.lnk.to/store
►Subscribe to Taylor Swift on YouTube: https://ts.lnk.to/subscribe

►Follow Taylor Swift Online:
TikTok: http://tiktok.com/@taylorswift
Instagram: http://instagram.com/taylorswift
Twitter: http://twitter.com/taylorswift13
Snapchat: http://snapchat.com/add/taylorswift
Facebook: http://facebook.com/taylorswift
Tumblr: http://taylorswift.tumblr.com
Website: http://www.taylorswift.com

►Follow Taylor Nation Online:
TikTok: http://tiktok.com/@taylornation
Instagram: http://instagram.com/taylornation
YouTube: https://youtube.com/taylornation
Twitter: http://twitter.com/taylornation13
Tumblr: http://taylornation.tumblr.com

#TaylorSwift #ShakeItOff', 72, '/media/a7db7c69-41bb-5cb6-9368-f6debad08bd9/thumbnail.webp', '/media/a7db7c69-41bb-5cb6-9368-f6debad08bd9/video.mp4', CAST('194ee690-0136-5a6f-9a26-94baa21c0b80' AS UUID), 3733595459, 14366004, CAST('2014-08-18T21:18:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('56da1188-880e-5c15-b7ee-5a9f3aa8fe84' AS UUID), CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID), NULL, 'grdmik2771', 'The Offspring come out and play 🤔🤔', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('56da1188-880e-5c15-b7ee-5a9f3aa8fe84' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6999569b-9d05-5349-92b9-51e6d85c3c0a' AS UUID), CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID), NULL, 'ViljarVeski-v2k', '💙🖤🤍Hello from Estonia...', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6999569b-9d05-5349-92b9-51e6d85c3c0a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ca5c110b-45f7-50e0-8caa-46005a95ec3f' AS UUID), CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID), NULL, 'Blackkittylover-666', 'Girl 💅🏻👯‍♀️', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ca5c110b-45f7-50e0-8caa-46005a95ec3f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a7db7c69-41bb-5cb6-9368-f6debad08bd9' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('f40e1da1-82ea-59a2-8413-75d57bcf1af6' AS UUID), 'seed-channel:f40e1da1-82ea-59a2-8413-75d57bcf1af6', 'f40e1da1-82ea-59a2-8413-75d57bcf1af6@catalog.invalid', 'Guns N'' Roses', CAST('2018-05-18T04:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2018-05-18T04:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('f40e1da1-82ea-59a2-8413-75d57bcf1af6' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID), 'Guns N'' Roses - Sweet Child O'' Mine (Alternate Version)', '#AppetiteForDestruction: The Debut Album, Remastered and Expanded. Available now as Box Set, Super Deluxe, Double LP, and Double CD here: https://lnk.to/AppetiteForDestructionYD/gnrstore 

Apple Music: https://lnk.to/AppetiteForDestructionYD/applemusic 
iTunes: https://lnk.to/AppetiteForDestructionYD/itunes 
Spotify: https://lnk.to/AppetiteForDestructionYD/spotify 
Amazon: https://lnk.to/AppetiteForDestructionYD/amazon 
Google Play: https://lnk.to/AppetiteForDestructionYD/google-play 

Site: https://www.gunsnroses.com/ 
Facebook: https://www.facebook.com/gunsnroses 
Twitter: https://twitter.com/gunsnroses 
Instagram: https://www.instagram.com/gunsnroses 

Music video by Guns N'' Roses performing Sweet Child O'' Mine. © 1987 UMG Recordings, Inc.

http://vevo.ly/MhW1zh', 25, '/media/f514076e-4ff0-5d02-81b3-a103bf299bbd/thumbnail.webp', '/media/f514076e-4ff0-5d02-81b3-a103bf299bbd/video.mp4', CAST('f40e1da1-82ea-59a2-8413-75d57bcf1af6' AS UUID), 315114415, 1779618, CAST('2018-05-18T04:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c65bc9c5-82db-54a3-845c-68d4e57e694a' AS UUID), CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID), NULL, 'chrislamy9307', 'Best ❤️', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c65bc9c5-82db-54a3-845c-68d4e57e694a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('10216076-d710-5b7b-9e40-b292a0ae117b' AS UUID), CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID), NULL, '林長美-h8w', 'とにかく良いね！！', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('10216076-d710-5b7b-9e40-b292a0ae117b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('377f1a86-e16d-54fa-99d7-49c8155a662e' AS UUID), CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID), NULL, 'traceysmith7502', 'Der fuhrer & those others wouldnt know', NULL, CAST('2026-09-24T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('377f1a86-e16d-54fa-99d7-49c8155a662e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1bc3f2e3-f72a-57ae-bcba-39b6168f8087' AS UUID), CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID), NULL, 'tatianaaparecidadias', 'minha banda favorita nunca consegui ir show de vcs vcs sou do interior se sp
por favor atenda meu pedido', NULL, CAST('2026-09-24T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1bc3f2e3-f72a-57ae-bcba-39b6168f8087' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f71fb213-40b6-5bce-b921-535f9578414a' AS UUID), CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID), NULL, 'tatianaaparecidadias', 'amo vocês quero conhecelhos por favor,atende meu pedido', NULL, CAST('2026-09-24T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f71fb213-40b6-5bce-b921-535f9578414a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d45a1817-6d71-5385-b8aa-0c80914aefc8' AS UUID), CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID), NULL, 'MeanwhileInUniverse', '2026 and here i am again for the millionth time 😂', NULL, CAST('2026-09-24T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d45a1817-6d71-5385-b8aa-0c80914aefc8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f514076e-4ff0-5d02-81b3-a103bf299bbd' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), 'Guns N'' Roses - Estranged', 'Music video by Guns N'' Roses performing Estranged.© 1993 Guns N'' Roses', 71, '/media/163987cc-d55c-563f-a713-e1e0deef30c5/thumbnail.webp', '/media/163987cc-d55c-563f-a713-e1e0deef30c5/video.mp4', CAST('f40e1da1-82ea-59a2-8413-75d57bcf1af6' AS UUID), 314156041, 1073491, CAST('2009-10-07T21:34:44.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f540a90b-72dd-513f-8c55-bf1fa72bcd10' AS UUID), CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), NULL, 'NathanBarger-g3p7e', 'I understand this song more at 50 than I did at 18 years old when it came out. Almost all of my loved ones have passed away and a lot of family members I have absolutely nothing to do with where they are completely toxic and only bring out the worst in me. In the end we are basically completely alone in this world even if we are surrounded by others.', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f540a90b-72dd-513f-8c55-bf1fa72bcd10' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('42cb5323-cb5e-5691-a6b2-8821956f5834' AS UUID), CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), NULL, 'elserone', 'love this song. it helps me get through many days', NULL, CAST('2026-09-29T13:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('42cb5323-cb5e-5691-a6b2-8821956f5834' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c5db023d-954d-5dc7-bccf-a6b6ea7c7ede' AS UUID), CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), NULL, 'nihue91', 'Por que se tiraba de un buque petrolero?? 🤌🏽', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c5db023d-954d-5dc7-bccf-a6b6ea7c7ede' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5ae306d2-3255-5e75-8318-933d868afaa5' AS UUID), CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), NULL, 'lucianamaiamesquita4732', 'The best music ❤️🌹🎸🎸🎸🎸🎤', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5ae306d2-3255-5e75-8318-933d868afaa5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('599dbfc7-4dc7-5078-8865-817be15713e5' AS UUID), CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), NULL, 'markR6.76', 'This was 30 years ahead of its time imo 💪', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('599dbfc7-4dc7-5078-8865-817be15713e5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a3b06967-e877-5b21-a9f2-9167227781b3' AS UUID), CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), NULL, 'Juan_FUANCITO78RDUKKE', 'Cuando la escuché por primera vez vía radio estación aquí en Medellín...solo una sola vez y me tiene aquí para siempre....una obra maestra', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a3b06967-e877-5b21-a9f2-9167227781b3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9545a123-288d-5794-b4df-375e83cfcd15' AS UUID), CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID), NULL, 'Dannagatuno', 'That''s my GOAT song', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9545a123-288d-5794-b4df-375e83cfcd15' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('163987cc-d55c-563f-a713-e1e0deef30c5' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('b282fb0d-31a2-5300-a936-f84405821a02' AS UUID), 'seed-channel:b282fb0d-31a2-5300-a936-f84405821a02', 'b282fb0d-31a2-5300-a936-f84405821a02@catalog.invalid', 'Marshmello', CAST('2023-03-03T00:00:08.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2023-03-03T00:00:08.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('b282fb0d-31a2-5300-a936-f84405821a02' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), 'Marshmello, Manuel Turizo - El Merengue (Official Video)', 'El Merengue
 
Marshmello & Manuel Turizo (Official Video)
 
Music:
Apple Music: https://SML.lnk.to/ElMerengue/applemusic
Spotify: https://SML.lnk.to/ElMerengue/spotify
Amazon: https://SML.lnk.to/ElMerengue/amazonmusicstreaming
YouTube: https://SML.lnk.to/ElMerengue/youtube
iTunes: https://SML.lnk.to/ElMerengue/itunes
Deezer: https://SML.lnk.to/ElMerengue/deezer
TikTok: https://SML.lnk.to/ElMerengue/tiktokusemysound
Pandora: https://SML.lnk.to/ElMerengue/pandora

Lyrics:
Vamos... 
Listo 
Salud muchachos, por esa mujer 
 
Estoy cansando de pensarte con el pecho roto 
Hay sol pero hace frio desde que no estas 
Me paso tomando mirando tus fotos 
Queriendo borrarlas pero no me da 
 
Hubiera dicho lo que siento 
Pa’ no dejar nada guardado 
Los besos que no te di te los hubiera robado 
Extrañarte me tiene con los ojos colorados 
No es lo mismo estar solo que estar solo enamorado 
 
Dije que te olvide 
Pero no te había olvidao 
No te había olvidao 
Ayy ayy ayy 
También dije que te superé y no te había superado 
No te había superado 
 
Borracho dije que ya te olvide pero no te había olvidao 
No te había olvidao 
Ayy ayy ayy También dije que te superé y no te había superado 
No te había superado 
 
Entrando a la disco 
La mire, la mire, la mire 
Y estaba bailando sola, bailando sola 
Me le pegue, me pegue, me pegue 
Y así se fueron la horas, un par de horas 
 
Dime, sin pena solo dime 
Pídeme lo que quieras menos que yo te olvide 
Cuando uno está tomando las palabras no mide 
Hoy te pido perdón si algún día borracho 
 
Dije que olvide pero no te había olvidao 
No te había olvidao 
Ayy ayy ayy 
También dije que te superé y no te había superado 
No te había superado 
 
Borracho dije que ya te olvide pero no te había olvidao 
No te había olvidao 
Ayy ayy ayy 
También dije que te superé y no te había superado No te había superado 
 
Entrando a la disco 
La mire, la mire, la mire 
Estaba bailando sola, bailando sola 
Me le pegue, me pegue, me pegue 
Y así se fueron la horas un par de horas 
 
La mire, la mire, la mire, 
Estaba bailando sola, bailando sola 
Me le pegue, me pegue, me pegue 
Y así se fueron la horas un par de horas 
 
Oopa como te voy a olvidar yo a ti 
Esta noche me sacan aquí borracho y contigo 
Si señor 
Por ti mujer 
Salud 

 
Marshmello: 
Merch https://www.marshmellomusic.com/collections/new-arrivals
Instagram http://instagram.com/marshmello
Facebook  http://facebook.com/marshmello
Twitter http://twitter.com/marshmello
Twitch http://twitch.tv/marshmellomusic
TikTok https://tiktok.com/@marshmello
 
Manuel Turizo:
Official Store https://manuelturizo.shop.musictoday.com/
Instagram https://www.instagram.com/manuelturizo/
Facebook https://www.facebook.com/ManuelTurizoMusic
Twitter https://twitter.com/ManuelTurizoMTZ
TikTok https://www.tiktok.com/@manuelturizoz?lang=en
 
Directors: Chadrick Preuss & Sandeep Vadlamudi
Executive Producer: Christian Breslauer
Producer:  Michael Breslauer
Production Company: The Lucky Bastards Inc.
 
#Marshmello #ManuelTurizo #ElMerengue
 
Music video by Marshmello & Manuel Turizo performing El Merengue (Official video). (C) 2023 Sony Music Entertainment US Latin LLC', 27, '/media/a2debe95-c462-5b10-bcd8-f81c7b74242f/thumbnail.webp', '/media/a2debe95-c462-5b10-bcd8-f81c7b74242f/video.mp4', CAST('b282fb0d-31a2-5300-a936-f84405821a02' AS UUID), 447950978, 1214969, CAST('2023-03-03T00:00:08.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6e3f3af9-e2eb-5743-aa53-c2922cfe879d' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'marshmello', 'Mellogang I hope you enjoy our new song together ❤', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 21000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6e3f3af9-e2eb-5743-aa53-c2922cfe879d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9072c352-a180-50a0-8cfc-570da1e946de' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'theangel4545', 'I love it', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 11
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9072c352-a180-50a0-8cfc-570da1e946de' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3a70da3b-26cc-57e0-8057-4eeb9b2396e9' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'Morics3', 'Bien eso', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 7
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3a70da3b-26cc-57e0-8057-4eeb9b2396e9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('92ddb1fe-475c-5aae-bc47-3fc2f55f4fdf' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'LuisFernandoFuentesgumucio', '​ @Morics3 noooooooooooooooooooøøøøøøøoooooo', NULL, CAST('2026-04-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('92ddb1fe-475c-5aae-bc47-3fc2f55f4fdf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('99643a25-9e54-562e-9710-8716fa391249' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'tygerrmusic', 'Such an amazing cultural combination right there! Marshmello and Manuel Turizo... RESPECT! 😌🙏🙌🙌🙌🙌❤ I''ll see you soon in Perú, Marshmello 🤩', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('99643a25-9e54-562e-9710-8716fa391249' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c197bebf-c196-5118-bd28-5264fb79428a' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'josemanuelrivera1918', 'Oh 😮 My God que tremendos estuvieron la Rompieron toda', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c197bebf-c196-5118-bd28-5264fb79428a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4256ea2f-7a08-5fb2-9c0c-f272db805a0d' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'GsCConcrete123', 'good to see you.   😁😁😁 you no my tags are [GsC] .', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4256ea2f-7a08-5fb2-9c0c-f272db805a0d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('57f81866-9646-5940-8247-a2194c8e3ae8' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'marionberlin4019', 'MEEEEGGGGAAA❣‼️👑💎🏆💰👑👑👑👑👑👑👑👑💪👍👌💯🙏🌹🌹🌹🌻🎁🎍💃🇩🇪👏👏👏👏👏👏👏👏', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('57f81866-9646-5940-8247-a2194c8e3ae8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('87f6b6c4-11f1-5328-9986-ee6454cae05f' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'idanielbel', 'I love it!', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('87f6b6c4-11f1-5328-9986-ee6454cae05f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1283176f-fcce-5ac0-8b80-96146a0463f6' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'stephanieandino', '🔥Gracias marshmallow Por hacer una canción en español', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1283176f-fcce-5ac0-8b80-96146a0463f6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e999f546-b9a5-543d-afe6-b130dfaaec03' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'mnigigi', '😍❤️❤️❤️❤️', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e999f546-b9a5-543d-afe6-b130dfaaec03' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d0edf561-f764-5d8a-8034-f5382b5255df' AS UUID), CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID), NULL, 'yungvmal', 'Yes we did it!!!😍', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d0edf561-f764-5d8a-8034-f5382b5255df' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a2debe95-c462-5b10-bcd8-f81c7b74242f' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('d596a8fb-d371-56b5-abd2-3f75f5aee271' AS UUID), 'seed-channel:d596a8fb-d371-56b5-abd2-3f75f5aee271', 'd596a8fb-d371-56b5-abd2-3f75f5aee271@catalog.invalid', 'Rick Astley', CAST('2009-10-25T06:57:33.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-10-25T06:57:33.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('d596a8fb-d371-56b5-abd2-3f75f5aee271' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), 'Rick Astley - Never Gonna Give You Up (Official Video) (4K Remaster)', 'The official video for “Never Gonna Give You Up” by Rick Astley. 

Never: The Autobiography 📚 OUT NOW! 
Follow this link to get your copy and listen to Rick’s ‘Never’ playlist ❤️ #RickAstleyNever
https://linktr.ee/rickastleynever

“Never Gonna Give You Up” was a global smash on its release in July 1987, topping the charts in 25 countries including Rick’s native UK and the US Billboard Hot 100.  It also won the Brit Award for Best single in 1988. Stock Aitken and Waterman wrote and produced the track which was the lead-off single and lead track from Rick’s debut LP “Whenever You Need Somebody”.  The album was itself a UK number one and would go on to sell over 15 million copies worldwide.

The legendary video was directed by Simon West – who later went on to make Hollywood blockbusters such as Con Air, Lara Croft – Tomb Raider and The Expendables 2.  The video passed the 1bn YouTube views milestone on 28 July 2021.

Subscribe to the official Rick Astley YouTube channel: https://RickAstley.lnk.to/YTSubID

Follow Rick Astley:
Facebook: https://RickAstley.lnk.to/FBFollowID 
Twitter: https://RickAstley.lnk.to/TwitterID 
Instagram: https://RickAstley.lnk.to/InstagramID 
Website: https://RickAstley.lnk.to/storeID 
TikTok: https://RickAstley.lnk.to/TikTokID

Listen to Rick Astley:
Spotify: https://RickAstley.lnk.to/SpotifyID 
Apple Music: https://RickAstley.lnk.to/AppleMusicID 
Amazon Music: https://RickAstley.lnk.to/AmazonMusicID 
Deezer: https://RickAstley.lnk.to/DeezerID 

Lyrics:
We’re no strangers to love
You know the rules and so do I
A full commitment’s what I’m thinking of
You wouldn’t get this from any other guy

I just wanna tell you how I’m feeling
Gotta make you understand

Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you

We’ve known each other for so long
Your heart’s been aching but you’re too shy to say it
Inside we both know what’s been going on
We know the game and we’re gonna play it

And if you ask me how I’m feeling
Don’t tell me you’re too blind to see

Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you

#RickAstley #NeverGonnaGiveYouUp #WheneverYouNeedSomebody #OfficialMusicVideo', 28, '/media/097a555a-d6c1-5870-bc25-55b6b0824864/thumbnail.webp', '/media/097a555a-d6c1-5870-bc25-55b6b0824864/video.mp4', CAST('d596a8fb-d371-56b5-abd2-3f75f5aee271' AS UUID), 1821590789, 19438934, CAST('2009-10-25T06:57:33.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c23f9da8-25eb-5fb2-a446-bd697f8b190e' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'YouTube', 'can confirm: he never gave us up', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 321000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c23f9da8-25eb-5fb2-a446-bd697f8b190e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9e58a8dc-ecb4-5b77-8f86-15a1a23e87e8' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'jrozlie', 'Remove ads from this video so we can rickroll', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4800
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9e58a8dc-ecb4-5b77-8f86-15a1a23e87e8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('150bbf84-e3ca-55e8-b35b-b38c51a78901' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'gizmokat8299', ' @jrozlie  who cares', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 506
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('150bbf84-e3ca-55e8-b35b-b38c51a78901' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8c04b6a7-9b98-5c49-8c71-71132772b722' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'MrKudegrace', ' @gizmokat8299  because its funny?', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 728
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8c04b6a7-9b98-5c49-8c71-71132772b722' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fb18def3-0e1b-5ee2-abe5-60b244ef0645' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'Cheese-fs8sh', 'Bro is 15 years late', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5500
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fb18def3-0e1b-5ee2-abe5-60b244ef0645' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d046920c-46d8-594e-b505-e846d172d2a4' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'YokeNoJoke', ' @Cheese-fs8sh  HELLO FELLOW COUNCIL MEMBER.', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 96
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d046920c-46d8-594e-b505-e846d172d2a4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('49ab5d48-e87b-5417-9888-70db493f98a5' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'SleepyBear_SB', 'Only took 15 years for YouTube to get rickrolled I guess', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3100
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('49ab5d48-e87b-5417-9888-70db493f98a5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('86975211-33e0-594a-9d99-ebcb50b5c58d' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'ShyGuy_cc', 'Youtube accidently got rickrolled', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1700
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('86975211-33e0-594a-9d99-ebcb50b5c58d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1414965d-e5a2-5197-bc56-53739948f583' AS UUID), CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID), NULL, 'linganguliguliwatcha', 'YOUTUBE AND ONE LIKE WOOHAAAAH', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 7500
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1414965d-e5a2-5197-bc56-53739948f583' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('097a555a-d6c1-5870-bc25-55b6b0824864' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('d3c69754-6c97-5d2c-af03-ce490f3273f5' AS UUID), 'seed-channel:d3c69754-6c97-5d2c-af03-ce490f3273f5', 'd3c69754-6c97-5d2c-af03-ce490f3273f5@catalog.invalid', 'Dig!', CAST('2009-02-25T06:25:55.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-02-25T06:25:55.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('d3c69754-6c97-5d2c-af03-ce490f3273f5' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID), 'The Proclaimers - I''m Gonna Be (500 Miles) (Official Music Video)', 'Official video forThe Proclaimers - "I''m Gonna Be (500 Miles)" from the album ''Sunshine on Leith''

Lyrics

When I wake up, well, I know I''m gonna be
I''m gonna be the man who wakes up next to you
When I go out, yeah, I know I''m gonna be
I''m gonna be the man who goes along with you
If I get drunk, well, I know I''m gonna be
I''m gonna be the man who gets drunk next to you
And if I haver, yeah, I know I''m gonna be
I''m gonna be the man who''s haverin'' to you

But I would walk five hundred miles
And I would walk five hundred more
Just to be the man who walked a thousand miles
To fall down at your door

When I''m workin'', yes, I know I''m gonna be
I''m gonna be the man who''s workin'' hard for you
And when the money comes in for the work I do
I''ll pass almost every penny on to you
When I come home (when I come home), oh, I know I''m gonna be
I''m gonna be the man who comes back home to you
And if I grow old, well, I know I''m gonna be
I''m gonna be the man who''s growin'' old with you

But I would walk five hundred miles
And I would walk five hundred more
Just to be the man who walked a thousand miles
To fall down at your door

Ta-da-da-ta, ta-da-da-ta, ta-da-da-ta, ta-da-da-ta
Ta-da-da-dan-te-la-dan-te-la-dan-te-le-la-da-da
Ta-da-da-ta, ta-da-da-ta, ta-da-da-ta, ta-da-da-ta
Ta-da-da-dan-te-la-dan-te-la-dan-te-le-la-da-da

When I''m lonely, well, I know I''m gonna be
I''m gonna be the man who''s lonely without you
And when I''m dreamin'', well, I know I''m gonna dream
I''m gonna dream about the time when I''m with you
When I go out (when I go out), well, I know I''m gonna be
I''m gonna be the man who goes along with you
And when I come home (when I come home), yes, I know I''m gonna be
I''m gonna be the man who comes back home with you
I''m gonna be the man who''s comin'' home with you

But I would walk five hundred miles
And I would walk five hundred more
Just to be the man who walked a thousand miles
To fall down at your door

Ta-da-da-ta, ta-da-da-ta, ta-da-da-ta, ta-da-da-ta
Ta-da-da-dan-te-la-dan-te-la-dan-te-le-la-da-da
Ta-da-da-ta, ta-da-da-ta, ta-da-da-ta, ta-da-da-ta
Ta-da-da-dan-te-la-dan-te-la-dan-te-le-la-da-da
Ta-da-da-ta, ta-da-da-ta, ta-da-da-ta, ta-da-da-ta
Ta-da-da-dan-te-la-dan-te-la-dan-te-le-la-da-da
Ta-da-da-ta, ta-da-da-ta, ta-da-da-ta, ta-da-da-ta
Ta-da-da-dan-te-la-dan-te-la-dan-te-le-la-da-da

And I would walk five hundred miles
And I would walk five hundred more
Just to be the man who walked a thousand miles
To fall down at your door

Official Website: http://www.proclaimers.co.uk/

#TheProclaimers #ImGonnaBe #500Miles', 27, '/media/3db91b11-0dfc-5f46-bbf7-752a633bd5d2/thumbnail.webp', '/media/3db91b11-0dfc-5f46-bbf7-752a633bd5d2/video.mp4', CAST('d3c69754-6c97-5d2c-af03-ce490f3273f5' AS UUID), 146127557, 1103005, CAST('2009-02-25T06:25:55.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1b6467c4-40ca-5edc-9274-43b55b73a222' AS UUID), CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID), NULL, 'tixanthrope', 'Fudge your sheep and fudge your HIMYM while I am at it. You have a Buster Keaton channeling young Depp, a mildly and adorably neurodiv young Masterson and you people are talking about what?😆', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1b6467c4-40ca-5edc-9274-43b55b73a222' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e7b6c40c-102a-5f07-95d7-96d0ea9542e9' AS UUID), CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID), NULL, 'KatelynnGoodyear', 'Thank you, mysterious man, dangerous, mysterious man that goes along with honey thank you so much in the spirit row you better know I don’t play around with the 10 Commandments says honey every year you hope you make trouble like everybody else is hacking me no joke', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e7b6c40c-102a-5f07-95d7-96d0ea9542e9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a40ab7c6-fb28-5529-8688-bd19f52967cd' AS UUID), CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID), NULL, 'KatelynnGoodyear', 'I don’t mean to scare you every year, but it’s dangerous to disobey the 10 Commandments around me says honey to CPS to Visa Police Dept NASA everybody Family everybody whoever everybody that’s monitoring me like go and get your STDs get your whatever the fuck I don’t give a shit you’ll never be me in the divine. I may be fat, but I can change that let’s get a laugh out of that right😂❤🎉', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a40ab7c6-fb28-5529-8688-bd19f52967cd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e0a8218a-c53d-5672-8a26-688aba9523bd' AS UUID), CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID), NULL, 'KatelynnGoodyear', 'To be that woman who walked 5000 miles more for you says honey every year I can’t believe this virtual attack games and all those bullshit with neighbors everybody and all this shit make it stop you know you can you just like the entertainment NASAFBI Police Dept everybody says honey and Visalia California. I don’t fuck with you like just don’t do that with me. That’s nasty shit I don’t do that. I stayed to myself.', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e0a8218a-c53d-5672-8a26-688aba9523bd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d22ff7d2-c26f-599b-94a1-fbc7ebe10d1e' AS UUID), CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID), NULL, 'Tamama1999', 'Where my wood go?', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d22ff7d2-c26f-599b-94a1-fbc7ebe10d1e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3db91b11-0dfc-5f46-bbf7-752a633bd5d2' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('bcdea6a9-8afb-5462-9ef5-7f4e6d423f55' AS UUID), 'seed-channel:bcdea6a9-8afb-5462-9ef5-7f4e6d423f55', 'bcdea6a9-8afb-5462-9ef5-7f4e6d423f55@catalog.invalid', 'Loquillo', CAST('2010-05-11T06:07:51.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2010-05-11T06:07:51.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('bcdea6a9-8afb-5462-9ef5-7f4e6d423f55' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID), 'Loquillo - Feo, fuerte y formal (Videoclip oficial)', 'Álbum ''Rock and Roll Actitud (1978-2018)'' ya disponible en: https://WarnerMusicSpain.lnk.to/Loquillo-RRA

Sigue a Loquillo en:
Facebook: https://www.facebook.com/Loquillo.rockandroll
Twitter: https://twitter.com/LOQUILLOoficial
Web: http://www.loquillo.com', 24, '/media/dee1b24d-2943-53ba-8401-51941b44c03b/thumbnail.webp', '/media/dee1b24d-2943-53ba-8401-51941b44c03b/video.mp4', CAST('bcdea6a9-8afb-5462-9ef5-7f4e6d423f55' AS UUID), 26100506, 75286, CAST('2010-05-11T06:07:51.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ed4bc02b-e611-56b5-85da-30f27e775bec' AS UUID), CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID), NULL, 'Kingipcy', '😅', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ed4bc02b-e611-56b5-85da-30f27e775bec' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('40650d78-e420-5057-af6b-d7a9c2e42d24' AS UUID), CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID), NULL, 'antonioruizvega3841', 'Cuando hay estilo... Hay estilo!!!', NULL, CAST('2026-09-21T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('40650d78-e420-5057-af6b-d7a9c2e42d24' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5a870fd1-6123-5845-9e69-cd00635dbb25' AS UUID), CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID), NULL, 'manuelsarmiento-f1z', 'Las tres f freir fregar y follar', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5a870fd1-6123-5845-9e69-cd00635dbb25' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a0aec2b4-9c28-5257-bf85-8d5aef51555b' AS UUID), CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID), NULL, 'osvaldomax19', 'Tengo 55 años y debo decir que la frase del título de esta canción se la escuché al chavo del 8 cuando le dice a Ron Damon que : " el hombre debe ser feo, fuerte y formal,  y a usted solo le falta ser fuerte y formal" Se lo cagó, ja ja ja', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a0aec2b4-9c28-5257-bf85-8d5aef51555b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('df966836-9321-53d7-83d4-8431a56d3fb3' AS UUID), CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID), NULL, 'angelespequenagarcia5554', 'Superrrrr❤', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('df966836-9321-53d7-83d4-8431a56d3fb3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d4bfde70-4d15-5e95-978b-fb26b9b53da8' AS UUID), CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID), NULL, 'josejacintogonzalez4658', 'La novena jajaja okey', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d4bfde70-4d15-5e95-978b-fb26b9b53da8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dee1b24d-2943-53ba-8401-51941b44c03b' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('e2236aab-cce5-5aa6-bb70-a9c1fbeef4d8' AS UUID), 'seed-channel:e2236aab-cce5-5aa6-bb70-a9c1fbeef4d8', 'e2236aab-cce5-5aa6-bb70-a9c1fbeef4d8@catalog.invalid', 'Txarango Oficial', CAST('2014-03-12T06:35:45.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2014-03-12T06:35:45.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('e2236aab-cce5-5aa6-bb70-a9c1fbeef4d8' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), 'Txarango - Músic de carrer (Videoclip Oficial)', 'Videoclip Oficial de "Músic de carrer", cançó que forma part del segon disc de Txarango "Som Riu", dirigit per Together Studio. Descarrega''t la nostra música a: www.txarango.com

Subscriu-te al nostre canal de YouTube aquí: http://radi.al/txarangosubscripcioyt

Segueix-nos a:
Facebook: https://www.facebook.com/txarango
Instagram: https://www.instagram.com/txarango
Twitter: https://twitter.com/txarango
Web Oficial: http://www.txarango.com', 29, '/media/3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c/thumbnail.webp', '/media/3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c/video.mp4', CAST('e2236aab-cce5-5aa6-bb70-a9c1fbeef4d8' AS UUID), 9662312, 32966, CAST('2014-03-12T06:35:45.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('02ac5859-c7e3-5a61-bc73-f6040d51b252' AS UUID), CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), NULL, 'HugoLópez-x4x', 'Vaig caminant com al firaire  quina mítica frase', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('02ac5859-c7e3-5a61-bc73-f6040d51b252' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('299d43d4-815f-5ae5-9e57-877b80a03911' AS UUID), CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), NULL, 'AriadnaPuigcollado', 'Quina pena que els Txarangos haiguin plegat😢', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('299d43d4-815f-5ae5-9e57-877b80a03911' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('01c5f5e0-ceb4-5717-8116-b490b0b2ba3a' AS UUID), CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), NULL, 'lluisvalles930', 'Visca la Música catalana visca Esquerra Republicana de Catalunya bona setmana ibon Nadal i bones festes', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('01c5f5e0-ceb4-5717-8116-b490b0b2ba3a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bb9c6e5e-2753-5500-ba9d-f8d0cc384f33' AS UUID), CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), NULL, 'wilma-guspetitnadal8425', 'Visca les meves arrels', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bb9c6e5e-2753-5500-ba9d-f8d0cc384f33' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fefe6e43-eb6e-5228-93d2-db9af3b06d44' AS UUID), CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), NULL, 'agusticampos881', 'Visca Catalunya Lliure!', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fefe6e43-eb6e-5228-93d2-db9af3b06d44' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bd7f9e7f-3a07-5850-abce-09eaf941a428' AS UUID), CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), NULL, 'beagomezcornejo6193', '😢 No te entiendo 😢', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bd7f9e7f-3a07-5850-abce-09eaf941a428' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('25db6404-e75f-5507-acc8-d1be3ced12cd' AS UUID), CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), NULL, 'joanadrover6912', '❤', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('25db6404-e75f-5507-acc8-d1be3ced12cd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0bb57c2a-7459-5743-845e-49c5e1c1eae5' AS UUID), CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID), NULL, 'izanxargay', 'Visca Catalunya', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 10
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0bb57c2a-7459-5743-845e-49c5e1c1eae5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3a0da35c-5002-51cf-8a66-e1ce0c5f9a5c' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('808f08e3-7150-5535-929f-b4abfccbfd40' AS UUID), 'seed-channel:808f08e3-7150-5535-929f-b4abfccbfd40', '808f08e3-7150-5535-929f-b4abfccbfd40@catalog.invalid', 'Luis Fonsi', CAST('2017-01-13T05:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2017-01-13T05:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('808f08e3-7150-5535-929f-b4abfccbfd40' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID), 'Luis Fonsi - Despacito ft. Daddy Yankee', '“Despacito” disponible ya en todas las plataformas digitales: https://UMLE.lnk.to/DOoUzFp 
“Imposible” disponible ya en todas las plataformas digitales: https://UMLE.lnk.to/IMPOSIBLEFp
“Calypso” disponible ya en todas las plataformas digitales: https://UMLE.lnk.to/CLYPSFp
Echame La Culpa disponible ya en todas las plataformas digitales: https://UMLE.lnk.to/ELCFp


Best of Luis Fonsi / Lo mejor Luis Fonsi: https://goo.gl/KLWPSa 
Subscribe here: https://goo.gl/nkhcGc
Sigue a Luis Fonsi: 
Official Site: http://www.luisfonsi.com/ 
Facebook: https://www.facebook.com/luisfonsi/ 
Twitter: https://twitter.com/LuisFonsi 
Instagram: https://www.instagram.com/luisfonsi

#LuisFonsi #Despacito #Imposible #Calypso #EchamelaCulpa #NadaEsImposible #NothingisImpossible #LF


Music video by Luis Fonsi performing Despacito. (C) 2017 Universal Music Latino', 38, '/media/d98da242-5fa6-5816-bdf4-28223954b586/thumbnail.webp', '/media/d98da242-5fa6-5816-bdf4-28223954b586/video.mp4', CAST('808f08e3-7150-5535-929f-b4abfccbfd40' AS UUID), 9133787469, 56710456, CAST('2017-01-13T05:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e7010ac6-f5f6-581f-8bb4-04939d7d404d' AS UUID), CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID), NULL, 'ElvisKabera', 'Love it 💯🔥🔥🔥 it rhymes with the series lots of love from kenya', NULL, CAST('2026-09-30T10:39:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e7010ac6-f5f6-581f-8bb4-04939d7d404d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('62dbdb25-edda-545b-b7e3-28d5892ec07f' AS UUID), CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID), NULL, 'jebra2eel', 'لا يوجد اجمل من اغاني الاسطورة اللبنانية فيروز ...', NULL, CAST('2026-09-30T10:32:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('62dbdb25-edda-545b-b7e3-28d5892ec07f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d98da242-5fa6-5816-bdf4-28223954b586' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('bc352503-d93f-526c-90e1-05709d33ab54' AS UUID), 'seed-channel:bc352503-d93f-526c-90e1-05709d33ab54', 'bc352503-d93f-526c-90e1-05709d33ab54@catalog.invalid', 'Post Malone', CAST('2018-10-05T17:46:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2018-10-05T17:46:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('bc352503-d93f-526c-90e1-05709d33ab54' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), 'Post Malone - Better Now', 'Official music video for "Better Now" by Post Malone.

Get The Song Here: https://PostMalone.lnk.to/bbYD 

►Subscribe for more: https://postmalone.lnk.to/subscribeYD
 
►Shop exclusive merch: https://postmalone.lnk.to/shop
 
►Follow Post Malone online:
https://www.postmalone.com
https://instagram.com/postmalone
https://twitter.com/postmalone
https://facebook.com/postmalone
https://snapchat.com/add/postmalone
https://tiktok.com/@postmalone
https://discord.com/invite/post-malone 

►Follow @ExtraPosty:
https://instagram.com/extraposty
https://twitter.com/extraposty
https://facebook.com/extraposty
https://tiktok.com/@extraposty

Video Director: Adam Degross 
Video Producer: Bobby Greenleaf 
Video Editor: Robert Henry 
Coloring: Travis Brothers

#PostMalone #BetterNow #beerbongsandbentleys

© 2018 Republic Records, a division of UMG Recordings, Inc.', 77, '/media/0993fbdd-ce12-5766-a12e-7f3a11d6942f/thumbnail.webp', '/media/0993fbdd-ce12-5766-a12e-7f3a11d6942f/video.mp4', CAST('bc352503-d93f-526c-90e1-05709d33ab54' AS UUID), 728556168, 4930455, CAST('2018-10-05T17:46:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0b429be2-cb7b-5d04-a93b-f2092ff63127' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'The.Potato21', 'Anyone here before October 2026?', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0b429be2-cb7b-5d04-a93b-f2092ff63127' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d47bd5bd-50d0-5025-8d84-97c14b6117aa' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'takeschikovac', 'Nobody believes them words spoken by a …. Can’t be true the invented lies', NULL, CAST('2026-09-29T13:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d47bd5bd-50d0-5025-8d84-97c14b6117aa' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ae4c2372-f187-5b77-84b8-37a048575af6' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'AlisonPrada-o5z', 'GOOD VIBES_____', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ae4c2372-f187-5b77-84b8-37a048575af6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('871e700c-f75f-5158-96d6-327e69970c4f' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'myongjelks3834', 'Sheesh lady are you trying tonn no fuck me on the ass stupi lady can I have some extra sour croutht', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('871e700c-f75f-5158-96d6-327e69970c4f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('73bc17f0-b2ba-535e-bfac-b70c15642955' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'Clipleo77', 'Good song for the ears', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('73bc17f0-b2ba-535e-bfac-b70c15642955' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('18043f8a-4032-5ed6-97b1-52ce921563d3' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'JustinHinzMagic', 'I still think that its cool as hell that this guy owns the One Ring.', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('18043f8a-4032-5ed6-97b1-52ce921563d3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('157eda63-389d-5f8d-9f3a-0be4ca103bee' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'magdielcisnero8222', '3:32 🛸 favorite part!', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('157eda63-389d-5f8d-9f3a-0be4ca103bee' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5c735c53-7406-5697-925e-56930033026c' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'AnasRafiq-f9c', 'I like this song so much more than ever 👍 🎵 🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵🎵!.', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5c735c53-7406-5697-925e-56930033026c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ca97b0f9-8ffe-599c-a8b2-7c68abe1ec44' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'MPerera-hn6gm', '4 mother war 😂 both', NULL, CAST('2026-09-25T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ca97b0f9-8ffe-599c-a8b2-7c68abe1ec44' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9344be8a-eb8c-5593-b2a8-bb40d2e17c86' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'JohnVille-g6s', 'I WHOOPED YOUR ASS AND DOJA CAT DONT EVER THREATEN MY FAMILY DOH', NULL, CAST('2026-09-25T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9344be8a-eb8c-5593-b2a8-bb40d2e17c86' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0a1f5b44-9b9e-54da-bd7d-0b47da57e39e' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'youllbeblessed', '❤️😘', NULL, CAST('2026-09-25T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0a1f5b44-9b9e-54da-bd7d-0b47da57e39e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2527e36e-5764-5066-8e25-f8ba4a817fe0' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'martinezmwanza1031', 'Forever the best❤🐐@ Post Malone 💯', NULL, CAST('2026-09-25T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2527e36e-5764-5066-8e25-f8ba4a817fe0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e9ce3689-6a18-5c61-b6d3-0db754ab5525' AS UUID), CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID), NULL, 'VeronicaJulie-k4v', '❤❤❤❤❤❤❤❤❤❤❤', NULL, CAST('2026-09-25T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e9ce3689-6a18-5c61-b6d3-0db754ab5525' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0993fbdd-ce12-5766-a12e-7f3a11d6942f' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), 'Post Malone - White Iverson', 'The official music video for "White Iverson" by Post Malone. Download the song here: https://PostMalone.lnk.to/wiID

🛍️ Shop exclusive music & merch: https://PostMalone.lnk.to/shopID

🛻Get the new album "F-1 Trillion: Long Bed" here: https://posty.lnk.to/f-1trillionlongbedID

📨Signup to the official Posty mailing list: https://postmalone.lnk.to/signupID

📽️Subscribe for more: https://postmalone.lnk.to/subscribeID
 
►Follow Post Malone online:
https://www.postmalone.com
https://instagram.com/postmalone
https://twitter.com/postmalone
https://facebook.com/postmalone
https://snapchat.com/add/postmalone
https://tiktok.com/@postmalone
https://discord.com/invite/post-malone 

►Follow @ExtraPosty:
https://instagram.com/extraposty
https://twitter.com/extraposty
https://facebook.com/extraposty
https://tiktok.com/@extraposty

Directed & Edited by Van Alpert
DOP: Christopher Velona
Shot by: Christopher Velona, James DeFina, Alex Alvarez, Mike Marasco, Darren Miller
Drone Operator: Darren Miller
Production Design & Production by Depict 33 (DEPICT33.COM)
Executive Producer: Ilona Klaver
Producer: Aaron Alpert
Art Department: Ryan Brimer & Jason Esquenazi

Special Thanks to Rolls Royce and the city of El Miraj

#PostMalone #WhiteIverson #Stoney', 29, '/media/5964b6e1-680d-5681-8292-7ee6dd04a2e0/thumbnail.webp', '/media/5964b6e1-680d-5681-8292-7ee6dd04a2e0/video.mp4', CAST('bc352503-d93f-526c-90e1-05709d33ab54' AS UUID), 1186168318, 6019906, CAST('2015-07-19T07:15:41.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('abe98f13-6aae-5725-beba-f664532bdf79' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'CarolNoelLocklear', 'I''m telling you right now these people are trying to take away American the Western and everything don''t give in please don''t give him we need America everybody please fight', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('abe98f13-6aae-5725-beba-f664532bdf79' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('66605e46-42d4-51dc-b949-c4591b785570' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'alexandrocampogiani6980', 'When Driving my Ducati alone and I''m my thoughts ,,leave everything for a moment.😊.', NULL, CAST('2026-09-29T13:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('66605e46-42d4-51dc-b949-c4591b785570' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a1d438ff-61f2-5f04-a91d-c3a2f093bd6c' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'alebeltran2486', 'Who’s still here 2026 ❤', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a1d438ff-61f2-5f04-a91d-c3a2f093bd6c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('aa38d919-70ef-51b0-874c-a0524b75f972' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'DavidVasquez-gi3ii', 'Good blessyou, bros,  sisters, everyone 🎉🎉🎉', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('aa38d919-70ef-51b0-874c-a0524b75f972' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fe95597c-c034-5576-9410-6e0c9d5d758c' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'DewYou-zn4ny', 'ROTC CREW was here! Graffiti lives! Nj usa 🇺🇸 🎉😊peace ✌️ POSTY! NY LEGEND! 🎤 🎙 🎤 🎙 😊', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fe95597c-c034-5576-9410-6e0c9d5d758c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c634e36b-3fbf-594f-bc3a-cfdac5a5eb96' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'JustinRichardPorterAnderson84', 'AGB cute❤', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c634e36b-3fbf-594f-bc3a-cfdac5a5eb96' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7b558f82-de81-570f-8d9d-d0696b722f37' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'KINGCORE192', '2026 and this jam still 🔥🔥🔥🔥🔥🔥🔥🔥', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7b558f82-de81-570f-8d9d-d0696b722f37' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('dbc9f22c-e9a9-5161-a1e8-ba972402f479' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'RealUnreleasedMusicForLife', 'I Was Dating A Girl Who I Thought I’d Marry. We Lasted Over 3 Years Even Though I Died Only 1 Year And 2 Months Into The Relationship. I Would Considered That Time To Be The Start Of The End. Life Has Its Own Course. Hanging By A Moment I Wish I Could Stand Still With You Again In Those Spaces In Time.', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('dbc9f22c-e9a9-5161-a1e8-ba972402f479' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a09473cc-6599-5baf-997d-a061abc22c45' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'Arielarias49', 'That Iverson jersey is nostalgic', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a09473cc-6599-5baf-997d-a061abc22c45' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b659209d-6edc-5d6c-9a9b-f5ccfb7113f5' AS UUID), CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID), NULL, 'aneezatayag4703', 'September 28, 2026 everyone? Leave a mark if ur still listening to this ❤️', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b659209d-6edc-5d6c-9a9b-f5ccfb7113f5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('5964b6e1-680d-5681-8292-7ee6dd04a2e0' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), 'Ed Sheeran - BLOW (with Chris Stapleton & Bruno Mars) [Official Music Video]', 'The official music video for Ed Sheeran - BLOW (with @chrisstapleton  & @brunomars)
The new album "=" is out now - listen here: https://es.lnk.to/equals
 
Taken from No.6 Collaborations Project released in 2019, which featured the hit singles ''I Don''t Care'', ''Cross Me'', ''Beautiful People'', ''Blow'', ''Best Part of Me'', ''Antisocial'', ''South of the Border'' &''Take Me Back To London''. 
 
Subscribe to the Ed Sheeran channel for all the best and latest official music videos, behind the scenes and live performances.  
http://bit.ly/SubscribeToEdSheeran 
 
See more official videos from Ed Sheeran here: 
https://www.youtube.com/watch?v=ryJgDL9jzKk&list=PLjp0AEEJ0-fGKG_3skl0e1FQlJfnx-TJz 

Listen to more from the No. 6 Collaborations Project here : 
https://www.youtube.com/playlist?list=PLjp0AEEJ0-fHZDWhxhKo0wG08bMUcRy3l
 
Follow Ed Sheeran on: 
Facebook: http://www.facebook.com/EdSheeranMusic  
Twitter: http://twitter.com/edsheeran  
Instagram: http://instagram.com/teddysphotos  
Official Website: http://edsheeran.com  

About Ed Sheeran: 
Ed Sheeran may be the quintessential pop star of the 2010s: an internationally acclaimed, multi-award winning singer/songwriter who seems to acknowledge no boundaries between styles or eras with elements of folk, hip-hop, pop, dance, soul, and rock woven throughout his music. 

His incredible catalogue includes the studio albums ‘+’ (plus), ‘x’ (multiply) and ‘÷’ (divide) which spawned hit singles such as ‘The A team’ , ’Lego House’, ‘Sing'', ‘Thinking Out Loud’, ‘Photograph’, ‘Shape Of You’, ‘Castle on The Hill’ and ‘Perfect’. 
 
In 2019, Ed Sheeran released the genre-spanning ‘No.6 Collaborations Project’ which featured a wide-range of artists including ‘Justin Bieber’, ‘Camilla’ Cabello’, ‘Travis Scott’, ‘Eminem’, ‘Cardi B, ‘Paulo Londra’, ‘Bruno Mars’ and ‘Stormzy’ amongst many others, producing hits such as ‘I Don’t Care’, ‘Beautiful People’, ‘South of The Border’ and ‘Take Me Back To London’. 
 
#EdSheeran #ChrisStapleton #BrunoMars', 30, '/media/e4f962ec-ca7c-5dfa-9576-bd8eb392193c/thumbnail.webp', '/media/e4f962ec-ca7c-5dfa-9576-bd8eb392193c/video.mp4', CAST('2ba82f4f-dcff-50a6-a6f9-561488e33797' AS UUID), 25260467, 359070, CAST('2019-07-08T07:00:26.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('73019b3e-6e85-528f-bfbc-a8f83573aec7' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'nicolaegs5747', 'Imagínate esta cancion con lenny kravitz', NULL, CAST('2026-09-19T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('73019b3e-6e85-528f-bfbc-a8f83573aec7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9bc5d5b8-bc8a-5bd1-bf4a-b5e9af4f0e88' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'becclaire7816', 'I just saw Mark Furze cover this on The Voice Australia -- never even heard of the song until now but what a banger, what a beattttt. Add it to  ya party playlist stat.', NULL, CAST('2026-09-18T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9bc5d5b8-bc8a-5bd1-bf4a-b5e9af4f0e88' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0f443ffc-4b31-52ef-99a2-be505805f31c' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'angelajohnson3990', 'I sing this song and just cry.......ET PHONE HOME!', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0f443ffc-4b31-52ef-99a2-be505805f31c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2ec5468e-1281-5f41-b661-fb546a56e33f' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'clairefantastic2713', 'Aha u KNOW WHERE I GOT THAT KINE FROM 🤣🤣🤣', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2ec5468e-1281-5f41-b661-fb546a56e33f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5ac680a2-7fcd-5ae7-9d2f-866b911a5fcf' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'clairefantastic2713', '😁 cresit where cresit is due.', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5ac680a2-7fcd-5ae7-9d2f-866b911a5fcf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8f024136-af18-5247-b3f4-35895512f52b' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'marcindorawa2046', 'Nie mogę przestać tego słuchać 😍🔥', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8f024136-af18-5247-b3f4-35895512f52b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5f15bc2f-b08b-58aa-8629-f1e7d3b830b1' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'MonicaMariaMcLean-y3j', 'Bruno mars would have to for my love', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5f15bc2f-b08b-58aa-8629-f1e7d3b830b1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f2d6d2e3-38f5-5496-bc1e-f9b61fff818c' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'generalon5552', 'who are these girls??', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f2d6d2e3-38f5-5496-bc1e-f9b61fff818c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2c5b1f9c-c9e9-5d30-9c14-5172b4e01259' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'generalon5552', 'wth??Where are the boys__', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2c5b1f9c-c9e9-5d30-9c14-5172b4e01259' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a8d22c3b-b941-5c63-9627-aebdb9777bdb' AS UUID), CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID), NULL, 'ChastityKarmaMarie', '❤I like it!', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a8d22c3b-b941-5c63-9627-aebdb9777bdb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e4f962ec-ca7c-5dfa-9576-bd8eb392193c' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('9072b5d5-25e6-5af6-b459-38ef5ac0a668' AS UUID), 'seed-channel:9072b5d5-25e6-5af6-b459-38ef5ac0a668', '9072b5d5-25e6-5af6-b459-38ef5ac0a668@catalog.invalid', 'The Offspring', CAST('2017-01-18T01:21:42.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2017-01-18T01:21:42.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('9072b5d5-25e6-5af6-b459-38ef5ac0a668' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), 'The Offspring - You''re Gonna Go Far, Kid (Official Music Video)', 'REMASTERED IN HD!
Playlist Best of Offspring: https://goo.gl/cwFfP6
Subscribe for more: https://goo.gl/JaSm1N

Music video by The Offspring performing You''re Gonna Go Far, Kid. (C) 2008 Round Hill Records Manufactured and distributed by Universal Music Enterprises, a division of UMG Recordings, Inc.

#TheOffspring #YoureGonnaGoFarKid #Remastered #OfficialMusicVideo', 74, '/media/c7244986-48cf-5aeb-9923-d251e6a8b53c/thumbnail.webp', '/media/c7244986-48cf-5aeb-9923-d251e6a8b53c/video.mp4', CAST('9072b5d5-25e6-5af6-b459-38ef5ac0a668' AS UUID), 160208105, 1283263, CAST('2017-01-18T01:21:42.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('417a1076-3c1a-5bb7-ad28-fed25b9aa590' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'Саша-з1ф2щ', 'You''re Gonna Go Far Kid', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('417a1076-3c1a-5bb7-ad28-fed25b9aa590' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9e2b22c4-e67b-5a0d-9faf-5e76e7ed6e9d' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'Lipsinkaa', 'Текст песни', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9e2b22c4-e67b-5a0d-9faf-5e76e7ed6e9d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7e0311cb-9210-550a-9087-b56f4dbbd159' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'PrincessViolet2K11', 'Uploaded: 2023-07-16', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7e0311cb-9210-550a-9087-b56f4dbbd159' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e4dd02a4-64bb-5442-bdd4-4f9c95f812cc' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'id_prisha', 'Ijin menggunakan musik untuk video classic slalom🙏', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e4dd02a4-64bb-5442-bdd4-4f9c95f812cc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d203a0d2-3759-5098-bbf6-aad16b516d48' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'jpavlisamil1023', '2026 ...and next year again', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d203a0d2-3759-5098-bbf6-aad16b516d48' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('29d930e5-7e2d-5b8f-907d-59010ebe4d8e' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'RetoKaufmann-x7i', 'Excellent, varied rock and metal radio station. Google it: "shogun rocks laut"  Have fun', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('29d930e5-7e2d-5b8f-907d-59010ebe4d8e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a763b6c8-7d67-5f9d-a370-f276ea81f969' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'Kaalyvicenti', 'Still bumping', NULL, CAST('2026-09-25T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a763b6c8-7d67-5f9d-a370-f276ea81f969' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6e1b9183-c5d5-55a2-9bad-3be20f410bf5' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'ktprivyet', 'La canción de Ulysses y todos los homosexuales que se esconden 😆', NULL, CAST('2026-09-24T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6e1b9183-c5d5-55a2-9bad-3be20f410bf5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('afbc7f3b-994b-5926-adef-f7d58f27e4ef' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'Julianavcviu', 'I love this music video. This "Goddess of Music" sees a sad guy and gives him a guitar; she cheers him up, and he goes on to bring joy to others—poor, sick, and invisible people—through his music. Later, he realizes he can make money, so he starts playing for pay—but only around rich people—and loses the love he once had for what he did. Because of this, she punishes him, and the guitar falls to the ground, showing that it wasn''t the instrument that created the music, but the person playing it.', NULL, CAST('2026-09-20T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 21
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('afbc7f3b-994b-5926-adef-f7d58f27e4ef' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('342d4377-4cad-5cee-bfda-a9bd50dfcc0d' AS UUID), CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID), NULL, 'PerChiK_hehe', 'My childhood song I’ve been looking for you for so long..', NULL, CAST('2026-09-19T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('342d4377-4cad-5cee-bfda-a9bd50dfcc0d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c7244986-48cf-5aeb-9923-d251e6a8b53c' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), 'The Offspring - Pretty Fly (For A White Guy) (Official Music Video)', 'REMASTERED IN HD!
Playlist Best of Offspring: https://goo.gl/cwFfP6
Subscribe for more: https://goo.gl/JaSm1N

Music video by The Offspring performing Pretty Fly (For A White Guy). (C) 1998 Round Hill Records Manufactured and distributed by Universal Music Enterprises, a division of UMG Recordings, Inc.

#TheOffspring #PrettyFly #Remastered', 30, '/media/1b3ec572-165d-5395-a5ef-03579ba962b5/thumbnail.webp', '/media/1b3ec572-165d-5395-a5ef-03579ba962b5/video.mp4', CAST('9072b5d5-25e6-5af6-b459-38ef5ac0a668' AS UUID), 131519832, 973794, CAST('2017-01-18T01:04:10.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fa0f9328-a40d-5715-ae0f-e5c6c9270541' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'EDNASANCHEZ-e5x', 'Cuy', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fa0f9328-a40d-5715-ae0f-e5c6c9270541' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cb07deb0-04fc-5311-ad93-3e829d8bc4f9' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'OmNomThomas', 'I knew a guy like this in highschool. he was a dick lmao', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cb07deb0-04fc-5311-ad93-3e829d8bc4f9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('97b459de-4f55-533d-a0f4-81d497a3de40' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'RepentB4TooLate', 'John Cena 😂', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('97b459de-4f55-533d-a0f4-81d497a3de40' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cf7b7e01-5cd8-51ea-b0e0-24391f11cbc5' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'CandiAnn7777', '❤❤❤❤❤❤❤❤❤2026', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cf7b7e01-5cd8-51ea-b0e0-24391f11cbc5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('270ca5de-3218-5a15-a7c8-f2410531251f' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, '0pnhv', 'UH HUH UH HAH', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('270ca5de-3218-5a15-a7c8-f2410531251f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8aededbe-2fad-5844-9747-d90334e1b214' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'StryKhymorodnyk', 'I am so old...', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8aededbe-2fad-5844-9747-d90334e1b214' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a35ada1e-7b2c-5aa1-922f-249a4ae07ca2' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'securityguardvr', '19:00', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a35ada1e-7b2c-5aa1-922f-249a4ae07ca2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('14daf937-7bda-55ee-bb83-198322f9de7f' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'faltomjager', 'My wife and I played this for Pep band in high school. I made a reference to this song tonight, and she asked what fly meant. I told her fly meant cool, and looked up the origin of the song. It was at this moment that we realized that neither of us had heard the original song. Have to say, we were not disappointed', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('14daf937-7bda-55ee-bb83-198322f9de7f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('51e76caf-c817-5013-b9c9-b78b94afe775' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'michaelcougle5051', 'Yep', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('51e76caf-c817-5013-b9c9-b78b94afe775' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('05daed26-0150-53ac-a45f-3068869ba2f0' AS UUID), CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID), NULL, 'danielivanfloreschavez261', 'Ése RIF está chingón', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('05daed26-0150-53ac-a45f-3068869ba2f0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b3ec572-165d-5395-a5ef-03579ba962b5' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('968da30e-0650-5047-badf-6af4e9dd2cdb' AS UUID), 'seed-channel:968da30e-0650-5047-badf-6af4e9dd2cdb', '968da30e-0650-5047-badf-6af4e9dd2cdb@catalog.invalid', 'Lauren Christy - Topic', CAST('2018-07-30T15:20:58.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2018-07-30T15:20:58.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('968da30e-0650-5047-badf-6af4e9dd2cdb' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('7bedb753-7714-5376-a1f6-89bcf86f3926' AS UUID), 'I Want What I Want', 'Provided to YouTube by Universal Music Group

I Want What I Want · Lauren Christy

Breed

℗ 1997 The Island Def Jam Music Group

Released on: 1997-01-01

Producer: Andy Scott
Producer: Tony Peluso
Producer, Composer Lyricist: Lauren Christy
Composer Lyricist: C. Midnight

Auto-generated by YouTube.', 77, '/media/7bedb753-7714-5376-a1f6-89bcf86f3926/thumbnail.webp', '/media/7bedb753-7714-5376-a1f6-89bcf86f3926/video.mp4', CAST('968da30e-0650-5047-badf-6af4e9dd2cdb' AS UUID), 60216, 615, CAST('2018-07-30T15:20:58.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('7bedb753-7714-5376-a1f6-89bcf86f3926' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('7bedb753-7714-5376-a1f6-89bcf86f3926' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('7bedb753-7714-5376-a1f6-89bcf86f3926' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('7bedb753-7714-5376-a1f6-89bcf86f3926' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('cf065455-5ff1-56af-8ffc-0e4b64bb5a88' AS UUID), 'seed-channel:cf065455-5ff1-56af-8ffc-0e4b64bb5a88', 'cf065455-5ff1-56af-8ffc-0e4b64bb5a88@catalog.invalid', 'Nirvana', CAST('2009-06-16T21:34:49.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-06-16T21:34:49.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('cf065455-5ff1-56af-8ffc-0e4b64bb5a88' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID), 'Nirvana - Come As You Are (Official Music Video)', 'REMASTERED IN HD!!
Official Music Video for Come As You Are performed by Nirvana.
 
‘Nevermind (30th Anniversary Edition)’ is available now: https://Nirvana.lnk.to/Nevermind30thID
 
Commemorating the 30th anniversary of Nirvana’s seminal 1991 release, ‘Nevermind’ is celebrated with the newly remastered album from the original analog tapes and 4 concerts from Amsterdam, Netherlands; Del Mar, California; Melbourne, Australia and Tokyo, Japan.
 
Follow Nirvana:
Website: https://www.nirvana.com
Facebook: https://www.facebook.com/Nirvana
Twitter: https://twitter.com/Nirvana
Subscribe on YouTube: https://Nirvana.lnk.to/YTSubscribeID
 
#Nirvana #ComeAsYouAre #Nevermind', 29, '/media/f612055b-6d6e-5e9d-a41a-0867a1ac4c07/thumbnail.webp', '/media/f612055b-6d6e-5e9d-a41a-0867a1ac4c07/video.mp4', CAST('cf065455-5ff1-56af-8ffc-0e4b64bb5a88' AS UUID), 735606406, 4778841, CAST('2009-06-16T21:34:49.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c3d95a8f-70a8-5cd4-846c-644521735431' AS UUID), CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID), NULL, 'Type1Paxman', '0:17', NULL, CAST('2026-09-30T10:19:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c3d95a8f-70a8-5cd4-846c-644521735431' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('77166755-08e2-5560-b581-66aa9ccf2996' AS UUID), CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID), NULL, 'alexanderhuber1407', 'Der Film zeigt mir immer wieder was ich nicht mehr will. Diesen Film kann man einfach immer und immer wieder schauen...', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('77166755-08e2-5560-b581-66aa9ccf2996' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7ebd27f2-997d-580e-87ab-bdcf81efd677' AS UUID), CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID), NULL, 'SPIRITFOX_11', 'No I Don''t Have A Gun 🥀', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7ebd27f2-997d-580e-87ab-bdcf81efd677' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('680162d4-8aed-52a8-9dc8-6be2a680eb2a' AS UUID), CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID), NULL, 'Likebutton001', '2026 start people in prison for the murder of the grate late goat kurt Cobain.he didn''t have a gun', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('680162d4-8aed-52a8-9dc8-6be2a680eb2a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c04a7fa4-5498-515a-8a5b-fa7f33f559e9' AS UUID), CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID), NULL, 'Lemoncrusher4455', 'What’s the big hollow body guitar Kurt’s using in this video I see the telecaster that became the Courtney tele but what’s that yellow hollow body', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c04a7fa4-5498-515a-8a5b-fa7f33f559e9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4d3f73a5-992b-5ae1-a803-708b083131aa' AS UUID), CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID), NULL, 'Save-ya-Boogieman', 'Some mf thought this was a Bible quote 😭', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4d3f73a5-992b-5ae1-a803-708b083131aa' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f612055b-6d6e-5e9d-a41a-0867a1ac4c07' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID), 'Nirvana - The Man Who Sold The World (MTV Unplugged)', 'REMASTERED IN HD!
Taken from the 25th Anniversary Editions of Nirvana – MTV Unplugged in New York
Order Now: https://Nirvana.lnk.to/Unplugged25

Listen to more from Nirvana: https://Nirvana.lnk.to/essentials

Subscribe for more videos: https://goo.gl/DS7Geg
Facebook: https://www.facebook.com/Nirvana/
Twitter: https://twitter.com/Nirvana
Instagram: https://www.instagram.com/nirvana.official.band/
Website and store: https://www.nirvana.com

Music video by Nirvana performing The Man Who Sold The World (Unplugged). (C) 1994 Geffen Records

#Nirvana #TheManWhoSoldTheWorld #Remastered #MTVUnplugged #VEVO', 24, '/media/679b309e-2157-51d2-97f4-b91af9be281f/thumbnail.webp', '/media/679b309e-2157-51d2-97f4-b91af9be281f/video.mp4', CAST('cf065455-5ff1-56af-8ffc-0e4b64bb5a88' AS UUID), 671271955, 3474677, CAST('2009-06-16T22:56:31.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bea013ed-484f-538f-8373-1eba4195ed5b' AS UUID), CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID), NULL, 'melisacruzcalmo3728', 'Mi mayor esfuerzo y sueño es ttt él al rey régimen 🥹,', NULL, CAST('2026-09-30T09:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bea013ed-484f-538f-8373-1eba4195ed5b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('563c92b4-527d-582e-8b19-882c33448d4b' AS UUID), CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID), NULL, 'yimsu1', 'Never heard this song before until watched nene in agt. And now become one of my favourite that keeps spinning in my head.', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('563c92b4-527d-582e-8b19-882c33448d4b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7bdff021-f951-5c18-8b54-e6c0066ce40e' AS UUID), CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID), NULL, 'Nersesss36', 'كيرت😕😕', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7bdff021-f951-5c18-8b54-e6c0066ce40e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a7788780-5305-57f1-a8cd-5af8b6b9bc76' AS UUID), CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID), NULL, 'melissadeleon2551', '09/29/2026', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a7788780-5305-57f1-a8cd-5af8b6b9bc76' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('679b309e-2157-51d2-97f4-b91af9be281f' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('17c266b7-7d8f-59e0-bc88-eb23950a71b5' AS UUID), 'seed-channel:17c266b7-7d8f-59e0-bc88-eb23950a71b5', '17c266b7-7d8f-59e0-bc88-eb23950a71b5@catalog.invalid', 'Linkin Park', CAST('2009-10-26T18:31:10.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-10-26T18:31:10.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('17c266b7-7d8f-59e0-bc88-eb23950a71b5' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), 'In The End [Official HD Music Video] - Linkin Park', 'In The End [Official HD Music Video] - Linkin Park
----------
New film UNSHATTER in theaters worldwide September 30. 
Get tickets and info: http://unshattermovie.com

From Zero | The New Album | Available Now
Order Now: https://lprk.co/fromzerodlx

Official Linkin Park Merch: http://lprk.co/store
Text/Call: https://lprk.co/text
Newsletter Sign Up: https://lprk.co/newsletter
YouTube Subscribe: http://lprk.co/youtube
Facebook: http://lprk.co/facebook
Instagram: http://lprk.co/instagram
TikTok: http://lprk.co/tiktok
Twitter: http://lprk.co/twitter
Discord: https://discord.gg/linkinpark

Directed by Joe Hahn and Nathan "Karma" Cox.

Lyrics:
It starts with one thing
I don''t know why
It doesn''t even matter how hard you try
Keep that in mind
I designed this rhyme
To explain in due time
All I know
Time is a valuable thing
Watch it fly by as the pendulum swings
Watch it count down to the end of the day
The clock ticks life away

It''s so unreal
Didn''t look out below
Watch the time go right out the window
Trying to hold on, didn''t even know
I wasted it all just to watch you go
I kept everything inside
And even though I tried, it all fell apart
What it meant to me

Will eventually be a memory of a time when
I tried so hard
And got so far
But in the end
It doesn''t even matter
I had to fall
To lose it all
But in the end
It doesn''t even matter

One thing, I don''t know why
It doesn''t even matter how hard you try
Keep that in mind
I designed this rhyme
To remind myself how
I tried so hard
In spite of the way you were mocking me
Acting like I was part of your property
Remembering all the times you fought with me
I''m surprised it got so
Things aren''t the way they were before
You wouldn''t even recognize me anymore
Not that you knew me back then
But it all comes back to me in the end
You kept everything inside
And even though I tried, it all fell apart
What it meant to me will eventually be a memory of a time when

I tried so hard
And got so far
But in the end
It doesn''t even matter
I had to fall
To lose it all
But in the end
It doesn''t even matter

I''ve put my trust in you
Pushed as far as I can go
For all this
There''s only one thing you should know
I''ve put my trust in you
Pushed as far as I can go
For all this
There''s only one thing you should know

I tried so hard
And got so far
But in the end
It doesn''t even matter
I had to fall
To lose it all
But in the end
It doesn''t even matter

#OfficialMusicVideo #LinkinPark #InTheEnd', 23, '/media/13dc381b-af30-5e9d-a276-798095a9e307/thumbnail.webp', '/media/13dc381b-af30-5e9d-a276-798095a9e307/video.mp4', CAST('17c266b7-7d8f-59e0-bc88-eb23950a71b5' AS UUID), 2347074980, 14195716, CAST('2009-10-26T18:31:10.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d3c3ca2d-0a97-5148-be32-aff560f954ac' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'vickymcdonough8790', 'My husband passed away on September 10th!! It’s so weird that I just happened to read this today thinking about him and then I read your comment!!', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d3c3ca2d-0a97-5148-be32-aff560f954ac' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('493b64a2-0fbd-51e0-a0dd-229a06997f67' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'dianecandidasouza5851', 'Música boa da minha época 1992❤', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('493b64a2-0fbd-51e0-a0dd-229a06997f67' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b7890269-6423-5379-bbba-6fee8dbaf8eb' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'ailo8625', 'Who''s     Here.      BEFORE _ .AFTER    2 BiLLiON       Views...👑.', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b7890269-6423-5379-bbba-6fee8dbaf8eb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e6d36e09-411a-5c44-803c-42538d75391d' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'ezequielarraidu2630', 'En algun lugar de Argentina hoy te recordó alguien', NULL, CAST('2026-09-30T09:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e6d36e09-411a-5c44-803c-42538d75391d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('16cb0509-5855-5e17-b736-a1b8084970bf' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'sweetspicy6787', '2026 still', NULL, CAST('2026-09-30T09:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('16cb0509-5855-5e17-b736-a1b8084970bf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('289c4a63-1496-5927-9106-f51276cfcec9' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'nobrainbroom', 'It starts with one
All I know
So unreal
Watch you go
I tried so hard and got so far
But in the end, it doesn''t even matter
I had to fall to lose it all
But in the end, it doesn''t even matter
One thing, I don''t know why
It doesn''t even matter how hard you try
Keep that in mind, I designed this rhyme
To remind myself of a time when I tried so hard
In spite of the way you were mockin'' me
Actin'' like I was part of your property
Remembering all the times you fought with me
I''m surprised it got so far
Things aren''t the way they were before
You wouldn''t even recognize me anymore
Not that you knew me back then
But it all comes back to me in the end
You kept everything inside
And even though I tried, it all fell apart
What it meant to me will eventually
Be a memory of a time when I
I tried so hard and got so far
But in the end, it doesn''t even matter
I had to fall to lose it all
But in the end, it doesn''t even matter
One thing, I don''t know why
It doesn''t even matter how hard you try
Keep that in mind
I designed this rhyme to explain in due time
All I know
Time is a valuable thing
Watch it fly by as the pendulum swings
Watch it count down to the end of the day
The clock ticks life away
It''s so unreal
Didn''t look out below
Watch the time go right out the window
Tryin'' to hold on, but you didn''t even know
Wasted it all just to watch you go
I kept everything inside
And even though I tried, it all fell apart
What it meant to me will eventually be a memory
Of a time when I tried so hard', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('289c4a63-1496-5927-9106-f51276cfcec9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b960d5c9-1f45-5419-88c7-5222dec40203' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'Nosixgarat', 'Miss you ❤❤❤', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b960d5c9-1f45-5419-88c7-5222dec40203' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('47eaf589-a409-5348-b41d-298e3b884ca9' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'RichardVera-ko7om', '29 de septiembre del 2026,  "viviras por siempre"', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('47eaf589-a409-5348-b41d-298e3b884ca9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0934733e-11d4-5fe1-b2ab-b8dce90d0a30' AS UUID), CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID), NULL, 'user-from.Russia', 'Бессмертные!', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0934733e-11d4-5fe1-b2ab-b8dce90d0a30' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('13dc381b-af30-5e9d-a276-798095a9e307' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), 'Numb (Official Music Video) [4K UPGRADE] – Linkin Park', 'Numb (Official Music Video) [4K UPGRADE] – Linkin Park
----------
New film UNSHATTER in theaters worldwide September 30. 
Get tickets and info: http://unshattermovie.com

From Zero (Deluxe Edition) - Out Now: https://lprk.co/fromzerodlx

Official Linkin Park Merch: http://lprk.co/store
Text/Call: https://lprk.co/text
Newsletter Sign Up: https://lprk.co/newsletter
YouTube Subscribe: http://lprk.co/youtube
Facebook: http://lprk.co/facebook
Instagram: http://lprk.co/instagram
TikTok: http://lprk.co/tiktok
Twitter: http://lprk.co/twitter
Discord: https://discord.gg/linkinpark

Lyrics:
I''m tired of being what you want me to be
Feeling so faithless, lost under the surface
Don''t know what you''re expecting of me
Put under the pressure of walking in your shoes
(Caught in the undertow, just caught in the undertow)
Every step that I take is another mistake to you
(Caught in the undertow, just caught in the undertow)

I''ve become so numb, I can''t feel you there
Become so tired, so much more aware
I''m becoming this, all I want to do
Is be more like me and be less like you

Can''t you see that you''re smothering me
Holding too tightly, afraid to lose control?
''Cause everything that you thought I would be
Has fallen apart right in front of you
(Caught in the undertow, just caught in the undertow)
Every step that I take is another mistake to you
(Caught in the undertow, just caught in the undertow)
And every second I waste is more than I can take

I''ve become so numb, I can''t feel you there
Become so tired, so much more aware
I''m becoming this, all I want to do
Is be more like me and be less like you

And I know
I may end up failing too
But I know
You were just like me with someone disappointed in you

I''ve become so numb, I can''t feel you there
Become so tired, so much more aware
I''m becoming this, all I want to do
Is be more like me and be less like you

I''ve become so numb, I can''t feel you there
(I''m tired of being what you want me to be)
I''ve become so numb, I can''t feel you there
(I''m tired of being what you want me to be) 

#LinkinPark #Meteora #Lost #Meteora20', 26, '/media/94c82425-d6de-57df-99ce-af07a01c963f/thumbnail.webp', '/media/94c82425-d6de-57df-99ce-af07a01c963f/video.mp4', CAST('17c266b7-7d8f-59e0-bc88-eb23950a71b5' AS UUID), 2801056133, 15706373, CAST('2007-03-05T08:12:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3e4b8bf3-7f05-50f9-88e2-0020a7b0bf3e' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'ailo8625', 'Who''s     Here.      BEFORE _ AFTER     2 BiLLiON       Views...👑.', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3e4b8bf3-7f05-50f9-88e2-0020a7b0bf3e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('64d6b7b9-383a-594e-a0e9-8f587199d16e' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'ailo8625', 'Who''s     Here.      BEFORE _ AFTER    3 BiLLiON       Views...👑.', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('64d6b7b9-383a-594e-a0e9-8f587199d16e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ce5a191a-6cc1-57a2-8de0-acaa643039db' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'thecaneater', 'I wonder how many teenagers tried t kill themselves to this song. I know I thought about it.', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ce5a191a-6cc1-57a2-8de0-acaa643039db' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('98425941-f31e-587c-9d66-289c5e4a7889' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'Garima.Estelle', 'This is my daily escape to scream out everything I’m holding inside', NULL, CAST('2026-09-30T09:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('98425941-f31e-587c-9d66-289c5e4a7889' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('900025e6-f40f-52ba-8200-8981207bf6c3' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'adiyabayarchimeg4951', 'J
Up in okm
Ugh 😅hhj😊huyyh😅u', NULL, CAST('2026-09-30T09:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('900025e6-f40f-52ba-8200-8981207bf6c3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('253fd580-7a44-564c-88f1-cb5b8dd0d564' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'Wolfiezz_woof', 'Rest in peace, Chester Bennington.', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('253fd580-7a44-564c-88f1-cb5b8dd0d564' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ec37125b-4a44-5d6f-acf4-2050046fb632' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'Aszrillheyqal', 'Ali litar petir taa kun Tum bum chi niang yasin hua hu akbar', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ec37125b-4a44-5d6f-acf4-2050046fb632' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c93ab626-05f8-5c11-9d8c-f7a8bbb00f10' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'nathaniellatchman9558', '2026🎉', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c93ab626-05f8-5c11-9d8c-f7a8bbb00f10' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7a0040ff-a75a-5f63-b59c-221a35b3c8d4' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'hiiiii_friends-s1l', 'Lagu best seller ps 2', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7a0040ff-a75a-5f63-b59c-221a35b3c8d4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d928e5f5-a940-5f13-a0fa-6abd090d1b20' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'nfirmansyah_', '2,8 billion. Chester, you should see this.', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d928e5f5-a940-5f13-a0fa-6abd090d1b20' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ed92fe53-876c-5295-b65f-478fdbf4d40d' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'MarilynRojas-m4n', 'This song is just Amazing 😍', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ed92fe53-876c-5295-b65f-478fdbf4d40d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ca09a2e9-9d55-598f-9973-3a30370bdd9a' AS UUID), CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID), NULL, 'vanych83', 'F.', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ca09a2e9-9d55-598f-9973-3a30370bdd9a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('94c82425-d6de-57df-99ce-af07a01c963f' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('3c4cd53c-9b3a-5e2e-a245-e26451c496ad' AS UUID), 'seed-channel:3c4cd53c-9b3a-5e2e-a245-e26451c496ad', '3c4cd53c-9b3a-5e2e-a245-e26451c496ad@catalog.invalid', 'HolyJonte', CAST('2009-10-12T23:08:24.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-10-12T23:08:24.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('3c4cd53c-9b3a-5e2e-a245-e26451c496ad' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), 'Requiem for a Dream - Best Trailer Music Ever!', 'Best Trailer music ever! From the Lord of the Rings trailers and the movie Requiem for a Dream!', 27, '/media/2058b1c8-6b10-5a3d-9076-c5b92b2e732d/thumbnail.webp', '/media/2058b1c8-6b10-5a3d-9076-c5b92b2e732d/video.mp4', CAST('3c4cd53c-9b3a-5e2e-a245-e26451c496ad' AS UUID), 35760394, 273564, CAST('2009-10-12T23:08:24.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('29117789-d23c-5bf1-89d5-03aca25c902b' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'scottcortez1313', 'This was everywhere not because it was good but cause they had the best publicist ever. For folks that think Enigma was ‘amazing’.', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('29117789-d23c-5bf1-89d5-03aca25c902b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('76595187-efad-5da4-9556-c5915721cc6e' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'shinakuma5567', 'Parece uma música, feita por uma elite milenar, dos descendentes dos deuses com as mulheres humanas, que governam este mundo, transmitindo para a humanidade sua perspectiva sobre nós, de como nos vêem.', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('76595187-efad-5da4-9556-c5915721cc6e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('062b4efe-7beb-573a-b209-8f433e0953c4' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'bunyamin_bro5324', 'bu müzik beni evrenin varolusuna götürüyor biz hiç olmasaydık yaşam olmasaydı sadece sonsuz karanlık', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('062b4efe-7beb-573a-b209-8f433e0953c4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3b3d2a0d-946d-5b28-89a1-6583a37c6ec1' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'fatboybob8359', '90% jumped onto the tune after smoking aces with RR but WHAT A FUCKING  ENDING SCENE WOW LOVE IT!!!!  BOTH MOVIES SO GOOD', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3b3d2a0d-946d-5b28-89a1-6583a37c6ec1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d3e59c38-4efd-52dd-b6e6-1a0b062a832f' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'sauravbang595', 'Watched this movie a long long time ago. Knew the repercussions of addictions. Yet I couldn''t save myself from it.', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d3e59c38-4efd-52dd-b6e6-1a0b062a832f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7e761ed4-9bd4-5c85-bb9b-54d4374f0d6f' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'aaaaa_vvvviii6057', 'Здравствуйте!Расскажите что у вас произошло?❤', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7e761ed4-9bd4-5c85-bb9b-54d4374f0d6f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2553a931-5a1f-5a73-bf7e-8a1ba409c05f' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'charliestyle575', 'Reminds me of the chaos that comes with opioid withdrawals as days 1-3 progressively become more and more chaotic and then the storm/chaos begins to settle slowly with more and more relief after making it passed day 4.... its like the song explains it but without words. A storm that spirals out of control and then slowly begins to settle down. Requiem for a dream was a fantastic movie for pairing this song to it.', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2553a931-5a1f-5a73-bf7e-8a1ba409c05f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8f471d4a-ea5b-5395-9179-65a01e92ccad' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'Blvck_Gvijin', 'Trailer of Assassin''s Creed One. It feels like 100 years ago', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8f471d4a-ea5b-5395-9179-65a01e92ccad' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('040faeae-b485-5956-83af-acbf96f92794' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'deliveli5460', 'This one hits me badly! Dont look back or dawn', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('040faeae-b485-5956-83af-acbf96f92794' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('164e838b-12c6-5f48-bd1f-c3de29a006d7' AS UUID), CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID), NULL, 'DarioDamian-99', '3:43', NULL, CAST('2026-09-24T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('164e838b-12c6-5f48-bd1f-c3de29a006d7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2058b1c8-6b10-5a3d-9076-c5b92b2e732d' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('deaf910b-0faf-5775-9033-2e23f06005d3' AS UUID), 'seed-channel:deaf910b-0faf-5775-9033-2e23f06005d3', 'deaf910b-0faf-5775-9033-2e23f06005d3@catalog.invalid', 'Extremoduro (Oficial)', CAST('2014-11-26T20:30:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2014-11-26T20:30:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('deaf910b-0faf-5775-9033-2e23f06005d3' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('cb0a8e0d-8c80-5abf-890f-a5aafeac66ba' AS UUID), 'Jesucristo García', 'Provided to YouTube by WM Spain

Jesucristo García · Extremoduro

Rock Transgresivo

℗ 1994 dro east west

Vocals: Extremoduro
Composer, Lyricist: Iniesta Roberto

Auto-generated by YouTube.', 23, '/media/cb0a8e0d-8c80-5abf-890f-a5aafeac66ba/thumbnail.webp', '/media/cb0a8e0d-8c80-5abf-890f-a5aafeac66ba/video.mp4', CAST('deaf910b-0faf-5775-9033-2e23f06005d3' AS UUID), 7090665, 39700, CAST('2014-11-26T20:30:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('cb0a8e0d-8c80-5abf-890f-a5aafeac66ba' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('cb0a8e0d-8c80-5abf-890f-a5aafeac66ba' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('cb0a8e0d-8c80-5abf-890f-a5aafeac66ba' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('cb0a8e0d-8c80-5abf-890f-a5aafeac66ba' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f66a17a4-7c95-5b3f-819f-a0d00ac5454e' AS UUID), CAST('cb0a8e0d-8c80-5abf-890f-a5aafeac66ba' AS UUID), NULL, 'FabiánFernandez-e8o', 'Fue Brutal MasT. 
Saludos ❤😊', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f66a17a4-7c95-5b3f-819f-a0d00ac5454e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('cb0a8e0d-8c80-5abf-890f-a5aafeac66ba' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('5a8b90fe-22eb-5711-b94e-66c00600b0b3' AS UUID), 'seed-channel:5a8b90fe-22eb-5711-b94e-66c00600b0b3', '5a8b90fe-22eb-5711-b94e-66c00600b0b3@catalog.invalid', 'Mägo de Oz', CAST('2013-11-11T22:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2013-11-11T22:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('5a8b90fe-22eb-5711-b94e-66c00600b0b3' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), 'Mägo de Oz- Fiesta pagana 2.0 (Videoclip oficial)', 'Álbum ''Finisterra'' disponible aquí: https://WarnerMusicSpain.lnk.to/finisterra

Nuevo álbum ''Diabulus in Opera'' (Live) ya disponible en: https://WarnerMusicSpain.lnk.to/diabulusinopera

Sigue a Mägo de Oz en:

https://magodeozoficial.com/
Facebook: https://www.facebook.com/magodeozoficial
Twitter: https://twitter.com/MagoOficial2012
Instagram: https://www.instagram.com/magodeozoficial/

#MagodeOz #FiestaPagana', 23, '/media/85def786-0d6c-5f1c-8311-948275352f6b/thumbnail.webp', '/media/85def786-0d6c-5f1c-8311-948275352f6b/video.mp4', CAST('5a8b90fe-22eb-5711-b94e-66c00600b0b3' AS UUID), 310088763, 1716027, CAST('2013-11-11T22:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3466c51a-3328-5326-9050-5c1985c9348b' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'MartaArboleda-k3w', 'Quien en 2026 escuchando este temaso


Like si eres uno de esos', NULL, CAST('2026-09-29T21:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3466c51a-3328-5326-9050-5c1985c9348b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('54192552-1ae3-5ca7-90e3-d2b5b7f1675b' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'isabellacastanos4834', '2:51 🔥🔥🔥', NULL, CAST('2026-09-29T19:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('54192552-1ae3-5ca7-90e3-d2b5b7f1675b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fd0e1943-a6bd-5265-be9e-1f31a866cf5d' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'MiguelRodriguez-tm1it', 'Mejor los 2000🎉🎉🎉🎉🎉', NULL, CAST('2026-09-29T19:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fd0e1943-a6bd-5265-be9e-1f31a866cf5d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bb533c49-cb45-5569-87bd-88dccc4767d3' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'Miamigodecuatropatas', '2026?', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bb533c49-cb45-5569-87bd-88dccc4767d3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('098570ea-b9dc-5889-83be-07edabb63b48' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'Jimena-g8s', 'Legos que hace falta', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('098570ea-b9dc-5889-83be-07edabb63b48' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fb887956-68a7-5608-a37a-09aecd76ca39' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'coreyrasec6208', 'Lo maximo 👌👌💯', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fb887956-68a7-5608-a37a-09aecd76ca39' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2dea5a2c-51cf-5206-bd42-4fef7ddcc8c9' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'ORLANDINO69', 'Septiembre del 2026 . Facebook me la hizo recordar, la puse en el 2017 y bueno aquí estoy otra vez!!!', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2dea5a2c-51cf-5206-bd42-4fef7ddcc8c9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('72a82534-39f4-5e42-93ea-969f0891d115' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'isabel.fredes6637', '🎸🎸🎸🎉🎉❤❤', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('72a82534-39f4-5e42-93ea-969f0891d115' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cf4180d1-fdde-5cfa-80e6-38ded82088cd' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'leth_5016', 'Una canción libertaria... ehhh!?
Canciones como está cobrarán mayor relevancia en el futuro cuando la gente se canse por completo del sistema corrupto en el que fueron forzados a vivir. Ni derecha ni izquierda, el primero es vendepatria y el segundo mediocremente solo sabe aplicar parches sobre un sistema que está totalmente corrupto. Gente corrupta solo puede criar políticos corruptos y leyes corruptas solo pueden moldear gente corrupta.  La próxima vez que piensen que el mundo está podrido recuerden que la mayor parte del mundo está regida por el mismo sistema y por ello es lógico que todos tengan exactamente el mismo resultado, un ciclo interminable de autodestrucción con noticias escalofriantes que se repiten a diario como si fuera una maldición (pero que nos puede importar si no nos pasa a nosotros, verdad? apuesto a que muchas de esas personas pensaron exactamente lo mismo), con excepción de algunas pocas naciones que decidieron seguir su propio camino y por ende obtuvieron completamente diferentes resultados en su economía, en su desarrollo tecnológico, cultural y sobre todo en el desarrollo de su sociedad. Si te dicen que el sistema fue creado en el nombre de la libertad recuerda que la libertad no existe si no tenemos un lugar al cuál regresar. 🕊⛓‍💥', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cf4180d1-fdde-5cfa-80e6-38ded82088cd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d53e80b8-81d4-5abd-9b60-75cd4fa25f67' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'JoséAdolfoVillegasHernández', 'Finisterra mango de Oz', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d53e80b8-81d4-5abd-9b60-75cd4fa25f67' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4cb7d3f9-8847-5bfe-ad17-49d51d220062' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'HectorDonaire-p7g', 'MUCHAS VOCES, PERO NINGUNA COMO LA ORIGINAL', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4cb7d3f9-8847-5bfe-ad17-49d51d220062' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1ad2ba73-b89e-56ab-9731-b41b2a0aa46f' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'carlos300014', 'nada que ver', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1ad2ba73-b89e-56ab-9731-b41b2a0aa46f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('03579819-60bd-5d95-9b2f-d7136a2f020e' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'evelynsánchez.7', 'Llevo escuchando está canción hace como 3 años y al principio pensé que hablaban de la parte de la religión... Pero con el paso de los años me di cuenta que no solo crítica de así decirlo a la religión y  conectas con situaciones actuales políticas y sociales que los gobernadores o políticos, nos quieren hacer creer... Poniendo encima ambas cosas que todos son muy creyentes de Dios. Creo que está canción representa todo lo que un pueblo los que en realidad sufren las consecuencias de los gobiernos es una protesta a toda la élite y a los que nos controlan..', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('03579819-60bd-5d95-9b2f-d7136a2f020e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8af72961-8a9e-5818-b6f8-79d9b3e16a90' AS UUID), CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID), NULL, 'evelynsánchez.7', 'Es un aspecto que vi  un TikTok protestando sobre la situación de política de COLOMBIA como en la parte que dice 2:51.... En mi pensamiento es una referencia de que ellos utilizan el nombre de Dios o que ellos tienen más dinero y las otras personas nos guerreamos de sol a sol y que al final de todo siempre queda nuestro sudor de poder saber que lo están mandando todos por los seres que queremos', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8af72961-8a9e-5818-b6f8-79d9b3e16a90' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('85def786-0d6c-5f1c-8311-948275352f6b' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('307f41c8-3835-5073-99a2-d1875e964ab0' AS UUID), 'seed-channel:307f41c8-3835-5073-99a2-d1875e964ab0', '307f41c8-3835-5073-99a2-d1875e964ab0@catalog.invalid', 'Danny Ocean', CAST('2016-09-18T22:56:41.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2016-09-18T22:56:41.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('307f41c8-3835-5073-99a2-d1875e964ab0' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), 'Danny Ocean - Me Rehúso (Official Audio)', 'Danny Ocean - Me Rehúso (Official Audio)

Subscribe here: https://www.youtube.com/@DannOcean?sub_confirmation=1

"Me Rehúso" available on all digital Platforms:
https://DannyOcean.lnk.to/MeRehuso

Listen to your favorite Danny Ocean tracks on any platform:
https://dannyoceanmx.lnk.to/Music

Connect with Danny Ocean:
https://www.instagram.com/dannocean/
https://www.twitter.com/dannocean
https://www.facebook.com/dannoceanmusic
https://www.tiktok.com/@dannocean

Enjoy “Lo Mejor de Danny Ocean” here:
https://www.youtube.com/playlist?list=PLleYzL-yXBIwuYEC9w4BPNavbdi19TsOh

Letra / Lyrics

Ba-ba-babylon girl
Ba-ba-babylon girl
Para todos aquellos amores que
Que fueron obligados a ser separados
Ba-ba-babylon girl
Ba-ba-babylon girl
Esta canción es para ti

Dime ¿Cómo le explico a mi destino que ya no estás ahí?
Dime ¿Cómo haré para desprenderme de este frenesí?
Esta locura que siento por ti
Con esta química que haces en mí
Y ya no puedo, girl
Ya no puedo, girl

Nena, discúlpame y si te ilusioné
Yo no lo quise hacer
Sé que en el amor cuando es real
ese vuelve, vuelve (vuelve, vuelve)
Pero cómo olvidar tu piel
Y cómo olvidarte mujer
Ya no puedo, girl
Ya no puedo, girl

Baby, no (baby, no)
Me rehúso a darte un último beso, así que guárdalo (guárdalo)
Para que la próxima vez te lo dé haciéndolo (haciéndolo)
Haciéndotelo así, así, así
Así como te gusta, baby

Sin mirar atrás, sin buscar a nadie más
Solo quiero estar contigo, woh
Si no te tengo aquí conmigo yo no quiero ser tu amigo
Porque tú eres mi camino, woh
Y yo solo quiero estar junto a ti
Nena, por favor entiéndelo
Solo dame tu mano y confía en mí
Si te pierdes sólo sigue mi voz

Y dale tiempo (tiempo)
Mami, al tiempo (tiempo)
Que tú, que yo
Estamos hechos para estar los dos

Y dale tiempo (tiempo)
Baby, al tiempo (tiempo)
Que tú y yo, que tú y yo
Estamos hechos para estar los dos
Baby, no (baby, no)
Me rehúso a darte un último beso así que guárdalo (guárdalo)
Para que la próxima vez te lo dé haciéndolo (haciéndolo)
Haciéndotelo así, así, así
Así como te gusta, baby (woh, woh)

Baby, no
Me rehúso a darte un último beso, así que guárdalo (guárdalo)
Para que la próxima vez te lo dé haciéndolo
Haciéndotelo así, así, así
Así como te gusta, baby

Así, así, así como te gusta, baby

Baby, no (baby, no)
Me rehúso a darte un último beso, así que guárdalo (guárdalo)
Para que la próxima vez te lo dé haciéndolo
Haciéndotelo así, así, así
Así como te gusta, baby

Y baby, no (baby, no)
Me rehúso a darte un último beso así que guárdalo (guárdalo)
Para que la próxima vez te lo dé haciéndolo
Haciéndotelo así, así
Así como te gusta, baby

#DannyOcean #MeRehuso', 29, '/media/ab133a86-bb79-5414-943b-b9659c7a9744/thumbnail.webp', '/media/ab133a86-bb79-5414-943b-b9659c7a9744/video.mp4', CAST('307f41c8-3835-5073-99a2-d1875e964ab0' AS UUID), 2097737018, 6462326, CAST('2016-09-18T22:56:41.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('602a0811-add9-537c-808e-c65140ac6052' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'GreciaHernandezsagahon', 'Esta canción no pasa de moda ❤', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('602a0811-add9-537c-808e-c65140ac6052' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b2ebbd7f-838e-55cc-bbce-ee6639114af3' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'SaraSalvatierra-n1v', 'Yo.  Es. Cucho.  Esta.  Musica.  Por. Que.  Metermino', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b2ebbd7f-838e-55cc-bbce-ee6639114af3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2327a4ba-7f57-5256-b10c-85186ba52e51' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'LuisPalomino-dh1xr', 'Quien en 2026', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2327a4ba-7f57-5256-b10c-85186ba52e51' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('24ee5ee9-94c5-5ac3-a8a2-a510c7e52c43' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'Zero_Appraiser', 'Añadir esto a la radio GTA6', NULL, CAST('2026-09-29T22:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('24ee5ee9-94c5-5ac3-a8a2-a510c7e52c43' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('35f43e94-1c1d-5c8a-91c5-8224bfdf16d3' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'ーーーーーーーーーーーーーーーーーーーーーーーーーー-c8n', 'Sí', NULL, CAST('2026-09-29T22:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('35f43e94-1c1d-5c8a-91c5-8224bfdf16d3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('126b3e3d-1200-532f-afe9-df097eef351c' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'IIIIIIIIIIIIIII-Z', '❤', NULL, CAST('2026-09-29T23:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('126b3e3d-1200-532f-afe9-df097eef351c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1e4fe7a7-4c6f-5abb-80d4-ca19d6112cf0' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'marizagarcia8668', 'Pabloooooooooo😢❤', NULL, CAST('2026-09-29T21:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1e4fe7a7-4c6f-5abb-80d4-ca19d6112cf0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4f450459-39b5-5158-91c4-2e07641cb63f' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'Jhonatan516', '....', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4f450459-39b5-5158-91c4-2e07641cb63f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e3bc9868-7dec-5fef-88ce-4f7ba27707e3' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'Jhonatan516', '...', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e3bc9868-7dec-5fef-88ce-4f7ba27707e3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2821665c-f56f-544b-80dd-81181bc690f8' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, 'kiraihainaut7546', 'NO IMPORTA CUÁNDO NI DÓNDE, ESTA CANCIÓN SERÁ SIEMPRE UNA DE LAS MEJORES DE LOS MEJORES MOMENTOS DE MI VIDA. VENEZUELA, TE AMO MUCHO.', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2821665c-f56f-544b-80dd-81181bc690f8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b71623a6-51ef-519e-849c-6e5965e0c043' AS UUID), CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID), NULL, '1lautyfer', '10 años ya ehh queloco', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b71623a6-51ef-519e-849c-6e5965e0c043' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ab133a86-bb79-5414-943b-b9659c7a9744' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('4ac1493b-3661-5f2e-b083-42b3cdf6d35a' AS UUID), 'seed-channel:4ac1493b-3661-5f2e-b083-42b3cdf6d35a', '4ac1493b-3661-5f2e-b083-42b3cdf6d35a@catalog.invalid', 'TRAZZTO', CAST('2017-03-13T20:26:05.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2017-03-13T20:26:05.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('4ac1493b-3661-5f2e-b083-42b3cdf6d35a' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), 'La Vikingcleta by Trazzto - Parodia la Bicicleta Shakira', 'Ragnar Lothbrok, el prota de Vikings, presenta "La Vikingcleta" un hit sobre sus ansias de conquista pese a la falta de medios.

Podéis colaborar con la causa con un dólar mensual en:  https://www.patreon.com/trazzto  Accederéis los primeros a todos los trazztornos y  haréis posible que me dedique a tiempo completo a hacer el mongolo para el descojone general. ¡Gracias!

Letra y voz: Trazzto

Ser Vikingo es guay
saquear es lo que hacemos todo el rato
pero cansa ya
hacerlo solo en los paises escandinavos.

Venga ya Ragnar
no seas quejica.
En Kattegat estás muy bien
tienes  playita.

Pero yo  quiero
cruzar el charco
matar cristianos
Pero es que no puedo  navegar
Porque Floki no me hace más barcos
Tengo que salir a conquistar
Con la mountain-bike y el hacha en la mano.
(Bis)

Así que guapa súbete a mi Vikingcleta.
Que soy vikingo y tengo una buena coleta.
pero si que queme tu aldea te molesta
haré sacrificios para animar la fiesta.

Quiero regresar
Porque Athelstan me tiene enamorado.
Conquisté París pero me lié y terminé
bautizado.

Venga ya Ragnar
no seas quejica.
En Kattegat estás muy bien
tiene playita

Pero yo  quiero
cruzar el charco
matar cristianos

Pero es que no puedo navegar
Porque Floki no me hace más barcos
Tengo que salir a conquistar
Con la mountain-bike y el hacha en la mano.
(Bis)

Mi hijo Bjorn se me ha puesto como un queso
y tengo más niños incluso uno sin huesos
han salido a su padre te hacen en un momento
el águila de sangre si les tocas los huevos.

Y con mi esposa Aslaug se me cae la baba
es guapa pero la pobre está como una cabra
quisiera  conocer el futuro que está escrito
pero es que me da cosa chupar al adivino.

Así que guapa súbete a mi Vikingcleta.
Que soy vikingo y tengo una buena coleta.
pero si que queme tu aldea te molesta
haré sacrificios para animar la fiesta

Vamos guapa súbete a mi Vikingcleta
Si nos caemos haremos juntos la croqueta.
Solo te pido que seas un poco discreta.
Si no pal Valhalla me manda Lagertha

Venga ya Ragnar
no seas quejica.
En Kattegat estás muy bien
tiene playita

Pero yo  quiero
cruzar el charco
matar cristianos

Pero es que no puedo navegar
Porque Floki no me hace más barcos
Tengo que salir a conquistar
Con la mountain-bike y el hacha en la mano.
(Bis)

Así que guapa súbete a mi Vikingcleta.
Que soy vikingo y tengo una buena coleta.
pero si que queme tu aldea te molesta
haré sacrificios para animar la fiesta

Vamos guapa súbete a mi Vikingcleta
Si nos caemos haremos juntos la croqueta.
Solo te pido que seas un poco discreta.
Si no pal Valhalla me manda Lagertha', 25, '/media/025ff398-a6bb-52ce-87a3-13177ca7bcae/thumbnail.webp', '/media/025ff398-a6bb-52ce-87a3-13177ca7bcae/video.mp4', CAST('4ac1493b-3661-5f2e-b083-42b3cdf6d35a' AS UUID), 553502, 9039, CAST('2017-03-13T20:26:05.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), 'FILM_AND_ANIMATION'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND category = 'FILM_AND_ANIMATION') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2a06d938-d1a0-52e0-bc52-bca51506f0f6' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'iristhebest16299', 'Aqui estamos en 2026 poniéndole esta maravillosa banda sonora a mi novio que se está pasando el Assassin''s Creed Valhalla 😂', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2a06d938-d1a0-52e0-bc52-bca51506f0f6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('df2d1f79-37d7-52cc-abe0-5eb2c586d9e7' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'სერ.ხოულ', 'hermano que nostalgia, pa mi esta es la version oficial de la cancion. me dieron ganas de ver vikings otra vez', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('df2d1f79-37d7-52cc-abe0-5eb2c586d9e7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7df0d868-c034-5a98-b654-6987868902d7' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'pablodellarno2914', '¿Cómo que estoy cantando esta canción en mi cabeza hace 8 años?', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 10
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7df0d868-c034-5a98-b654-6987868902d7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6710fda1-c92b-5d5d-90ce-5cc1f7aa5f89' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'hljott-anne', 'Preiswert radfahren (3:02) eso no está ahí de casualidad. Esto es la Vikingcleta.', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6710fda1-c92b-5d5d-90ce-5cc1f7aa5f89' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fbf62b11-561a-515e-96ae-1d6c3d4106ad' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'alvarocolomo7910', 'En 2024 y sigue siendo todo un temazo', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fbf62b11-561a-515e-96ae-1d6c3d4106ad' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b0746c46-3bb1-5533-b80f-e34872db9b37' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'wigs-m1h', 'Aquí después de varios años ya 😢', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b0746c46-3bb1-5533-b80f-e34872db9b37' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5a4b6670-026b-5f14-911f-b2e7891de1d7' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'jaymamayz-ow3nm', 'Esta obra es sublime!', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5a4b6670-026b-5f14-911f-b2e7891de1d7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('35ce8dad-418a-5a7c-8cc4-06896f1c7599' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'Javimuro93', 'Deberían hacer una versión 2.0 donde hiciera mencion de la historia de principio a fin', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('35ce8dad-418a-5a7c-8cc4-06896f1c7599' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('09e6f051-ad88-51f5-bdaa-36e891913fa4' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'zayrablack1994', 'Es normal que me siga gustando en 1 de enero de 2024? Y más que la original además jajaja 😂', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('09e6f051-ad88-51f5-bdaa-36e891913fa4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d844b3e8-0600-5ee1-b333-a11e5cba0baa' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'javierbarc9', '2023 y seguimos aquí, buenísima letra 😂😂', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d844b3e8-0600-5ee1-b333-a11e5cba0baa' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ba71fd9b-9e7e-50c9-9d6a-d0884e98aae2' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'clarissareichling430', '¿ES LA CABCIÓN EN Spotify?', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ba71fd9b-9e7e-50c9-9d6a-d0884e98aae2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d2c50cfc-fdbb-539f-9022-7caeddeda314' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'golestadio', 'Felices fiestas Trazzto!! me ha saltado este tema en una lista de reproducción automática de musica!!! que buenos recuerdos!!! Mucha salud y feliz año nuevo!!!', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d2c50cfc-fdbb-539f-9022-7caeddeda314' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4bba5e8f-81b9-5296-9ffe-11c8e2fc3026' AS UUID), CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID), NULL, 'TRAZZTORNOS', 'Gracias! Felices Fiestas a ti también! El mejor regalo es que se acuerden de uno. 😘', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4bba5e8f-81b9-5296-9ffe-11c8e2fc3026' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('025ff398-a6bb-52ce-87a3-13177ca7bcae' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('bffdb62d-f505-527a-9440-9dffdf2974f4' AS UUID), 'seed-channel:bffdb62d-f505-527a-9440-9dffdf2974f4', 'bffdb62d-f505-527a-9440-9dffdf2974f4@catalog.invalid', 'Michael Jackson', CAST('2009-10-03T20:55:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-10-03T20:55:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('bffdb62d-f505-527a-9440-9dffdf2974f4' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), 'Michael Jackson - Bad (Shortened Version)', '“Bad” by Michael Jackson
Listen to Michael Jackson: https://MichaelJackson.lnk.to/_listenYD

For the first of nine short films for the “Bad” album, Michael Jackson enlists acclaimed filmmaker and director Martin Scorsese and together they create an epic 18-minute tale of urban and racial challenges in the 1980s inspired by the real life story of Edmund Perry. The "Bad" recording is the second of five consecutive No.1 singles from the album making Michael the first artist to achieve this milestone and in 2014 Rolling Stone ranked this short film second on a list of Michael''s 20 greatest short films.
 
Subscribe to the official Michael Jackson YouTube Channel: https://MichaelJackson.lnk.to/subscribeYD

Follow Michael Jackson:
Facebook: https://MichaelJackson.lnk.to/_followYS/facebook
Twitter: https://MichaelJackson.lnk.to/_followYS/twitter
Instagram: https://MichaelJackson.lnk.to/_followYS/instagram
Website: https://MichaelJackson.lnk.to/_followYS/websitegeneral
Spotify: https://MichaelJackson.lnk.to/_followYS/spotify

 
Chorus:
Because I''m bad, I''m bad come on
You know I''m bad, I''m bad come on, you know
You know I''m bad, I''m bad come on, you know
And the whole world has to
Answer right now
Just to tell you once again
Who''s bad
 
#MichaelJackson #Bad', 39, '/media/def62a34-fc23-56af-b355-19b33b6b02b4/thumbnail.webp', '/media/def62a34-fc23-56af-b355-19b33b6b02b4/video.mp4', CAST('bffdb62d-f505-527a-9440-9dffdf2974f4' AS UUID), 631014311, 4137407, CAST('2009-10-03T20:55:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('985d6976-ceab-5035-86fb-6cf6e0728bfc' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'Maysa-e5x', 'J''aime bien Michael Jackson le meilleur chanteur du monde❤❤❤❤❤❤❤❤❤😊😊😊😊😊😊😊😊😊😊😊😊😊😊😮😅😅😅😅😅😅😅😅🙂‍↕️ oui', NULL, CAST('2026-09-30T10:28:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('985d6976-ceab-5035-86fb-6cf6e0728bfc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a1d84516-24ea-5a67-b79c-9d3b3e189df1' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'Maysa-e5x', '😊😊😊😊😊😊😊😊😊😊😊😊😊❤ Michael Jackson😮 Michael Jackson', NULL, CAST('2026-09-30T10:27:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a1d84516-24ea-5a67-b79c-9d3b3e189df1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e47cc17c-de5f-53d5-86e9-29533ef58c0d' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'ArnaudSpitz', 'Bonjour aujourd''hui 631 005 635 vues le 30 septembre 2026 et vive les femmes surtout ma Caroline ❤❤❤ et il faut absolument inviter Alexandre pasteur de France Télévisions et Paul seixas Jean Luc Reichmann pour un dîner de cons ils sont champions du monde 😅😅😅 et bon anniversaire à Marion Cotillard et monica Bellucci bisous 😘😘😘', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e47cc17c-de5f-53d5-86e9-29533ef58c0d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8a8373e1-1005-5060-ab10-41f07f2ea2c1' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'Ali_S_Ali_Dra', 'The only legend whom his star keeps shining after demised 😢 .. Michael has a fan who wasn''t even born ❤', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8a8373e1-1005-5060-ab10-41f07f2ea2c1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1414bde5-0732-5268-b5c8-b4ab45351202' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'VivekShukla-l5n3n', 'We all miss MJ  😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭😭', NULL, CAST('2026-09-30T09:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1414bde5-0732-5268-b5c8-b4ab45351202' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fa699517-adcc-5bd7-a15b-7d01ad547269' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'maxsantos2452', 'ETERNO ❤️‍🔥👑♾️👑❤️‍🔥', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fa699517-adcc-5bd7-a15b-7d01ad547269' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cc729c8e-3119-5152-91fd-7269030d62ca' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'Jbsutt', 'This was my favorite "version" of Michael Jackson', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cc729c8e-3119-5152-91fd-7269030d62ca' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('dc9ac7e2-2f2d-5a71-8c9b-838195e34a69' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'cristiancardona2442', 'La mejor música que voy a poder escuchar en mi vida ❤', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('dc9ac7e2-2f2d-5a71-8c9b-838195e34a69' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3f7bf45c-7b36-5a3d-ad6b-f0d8c8f97d5c' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'amyleannharrington', 'rip Michael Jackson what a thriller 1:43', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3f7bf45c-7b36-5a3d-ad6b-f0d8c8f97d5c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f51ea7c5-de34-5a81-892e-9743bbf7fade' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'robertoramos8650', '❤❤🎉', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f51ea7c5-de34-5a81-892e-9743bbf7fade' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f9ea418d-4f2b-5b5f-8c04-8115759b5ff5' AS UUID), CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID), NULL, 'MichaelJackson-b7d', '4:20 your butt is mine gonna tell you right just show your face In Broad Daylight I''m telling you on how I feel gonna hurt your mind don''t shoot to kill Shamone ,Shamone  lay on me ah, all right I''m giving you on count of three to show your stuff or let it be ah, I''m telling you just to watch your mouth I know your game what you''re about.well they say the sky the limit and to me that''s really true ah, but my friend you have seen nothing just wait til''I get through because I''m bad I''m bad, Shamone you know I''m bad I''m bad you know It you know I''m bad I''m bad Shamone you know and the whole world has to answer right now just to tell you once again who''s bad. The word is out is you''re doing it wrong gonna lock you up before too long', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f9ea418d-4f2b-5b5f-8c04-8115759b5ff5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('def62a34-fc23-56af-b355-19b33b6b02b4' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('49107efd-3539-5dd6-8a9f-f5590885aedd' AS UUID), 'seed-channel:49107efd-3539-5dd6-8a9f-f5590885aedd', '49107efd-3539-5dd6-8a9f-f5590885aedd@catalog.invalid', 'T-Series', CAST('2022-04-11T10:30:13.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2022-04-11T10:30:13.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('49107efd-3539-5dd6-8a9f-f5590885aedd' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('cd1e7151-2dd4-5468-8e73-0ceae06f1f84' AS UUID), 'Naacho Naacho (Full Video) RRR - NTR, Ram Charan | M M Kreem | SS Rajamouli | Vishal Mishra & Rahul', 'Naacho Naacho - Full Video from #RRRMovie.  An  M. M. Kreem  Musical. Sung  by  Vishal Mishra & Rahul Sipligunj.

#NaachoNaachoSong

♪Stream the Full Song Here♪ 
JioSaavn: https://bit.ly/NaachoNaacho-RRR-JioSaavn
Spotify: https://bit.ly/NaachoNaacho-RRR-Spotify
Hungama: https://bit.ly/NaachoNaacho-RRR-Hungama
Gaana: https://bit.ly/NaachoNaacho-RRR-Gaana
Apple Music: https://bit.ly/NaachoNaacho-RRR-AppleMusic
Amazon Prime Music: https://bit.ly/NaachoNaacho-RRR-AmazonPrimeMusic
Wynk: https://bit.ly/NaachoNaacho-RRR-Wynk
Resso: https://bit.ly/NaachoNaacho-RRR-Resso
iTunes: https://bit.ly/NaachoNaacho-RRR-iTunes
YouTube Music: https://bit.ly/NaachoNaacho-RRR-YouTubeMusic

Song Name: NAACHO  NAACHO
Music Director: M. M. Kreem 
Lyricist: Riya Mukherjee 
Singer: Vishal Mishra, Rahul Sipligunj
Choreography by:  Prem Rakshith
Programmed by: G. Jeevan Babu, Siddharth S 
Mixed and Mastered by: G. Jeevan Babu 
Recorded at JB Studios. 
Lyric Video by:  Walls And Trends

Movie: RRR Cast: NTR, Ram Charan, Ajay Devgn, Alia Bhatt, Olivia Morris, Samuthirakani, Alison Doody, Ray Stevenson 
Screenplay & Direction: S.S. Rajamouli 
Presented by: D. Parvathi 
Producer: DVV Danayya
 Banner: DVV Entertainment 
Story: V. Vijayendra Prasad 
DOP: K.K. Senthil Kumar 
Production Designer: Sabu Cyril 
Music Composer: M.M. Kreem
VFX Supervision: V Srinivas Mohan 
Editor: Sreekar Prasad 
Costume Designer: Rama Rajamouli 
Telugu Dialogues: Sai Madhav Burra 
Hindi Dialogues: Riya Mukherjee 
Tamil Dialogues: Madan Karky 
Kannada Dialogues: Varadaraju Chikkaballapura 
Malayalam Dialogues: Gopala Krishnan 
North India Distribution: Pen Studios and Dr. Jayantilal Gada (Pen Studios) 
Tamilnadu Distribution: Lyca Productions 
Branding & Marketing: Walls and Trends
Music Label: Lahari Music, T series


___________________________________
Enjoy & stay connected with us!
👉 Subscribe to T-Series: http://bit.ly/TSeriesYouTube
👉 Like us on Facebook: https://www.facebook.com/tseriesmusic
👉 Follow us on Twitter: https://twitter.com/tseries
👉 Follow us on Instagram: http://bit.ly/InstagramTseries', 25, '/media/cd1e7151-2dd4-5468-8e73-0ceae06f1f84/thumbnail.webp', '/media/cd1e7151-2dd4-5468-8e73-0ceae06f1f84/video.mp4', CAST('49107efd-3539-5dd6-8a9f-f5590885aedd' AS UUID), 754723957, 4076598, CAST('2022-04-11T10:30:13.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('cd1e7151-2dd4-5468-8e73-0ceae06f1f84' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('cd1e7151-2dd4-5468-8e73-0ceae06f1f84' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('cd1e7151-2dd4-5468-8e73-0ceae06f1f84' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('cd1e7151-2dd4-5468-8e73-0ceae06f1f84' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('450bf6b8-f2b7-57ab-adc8-7e7b7a42982d' AS UUID), CAST('cd1e7151-2dd4-5468-8e73-0ceae06f1f84' AS UUID), NULL, 'SaiKiranGangapure', 'Understand.. 1000000000000', NULL, CAST('2026-09-29T17:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('450bf6b8-f2b7-57ab-adc8-7e7b7a42982d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('cd1e7151-2dd4-5468-8e73-0ceae06f1f84' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('a2f36f75-e6bd-5075-a2b9-4a22b5f4ddd0' AS UUID), 'seed-channel:a2f36f75-e6bd-5075-a2b9-4a22b5f4ddd0', 'a2f36f75-e6bd-5075-a2b9-4a22b5f4ddd0@catalog.invalid', 'Anegats - Topic', CAST('2014-11-20T13:57:49.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2014-11-20T13:57:49.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('a2f36f75-e6bd-5075-a2b9-4a22b5f4ddd0' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('c600cb07-b627-5954-9e02-bd642359bbf1' AS UUID), 'Paraula de senyor', 'Provided to YouTube by The Orchard Enterprises

Paraula de senyor · Anegats

Mons Diferents

℗ 2005 PRODUCCIONS BLAU S.L.

Released on: 2008-08-05

Music Publisher: DISCMEDI S.A.

Auto-generated by YouTube.', 30, '/media/c600cb07-b627-5954-9e02-bd642359bbf1/thumbnail.webp', '/media/c600cb07-b627-5954-9e02-bd642359bbf1/video.mp4', CAST('a2f36f75-e6bd-5075-a2b9-4a22b5f4ddd0' AS UUID), 219413, 666, CAST('2014-11-20T13:57:49.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('c600cb07-b627-5954-9e02-bd642359bbf1' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('c600cb07-b627-5954-9e02-bd642359bbf1' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('c600cb07-b627-5954-9e02-bd642359bbf1' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c600cb07-b627-5954-9e02-bd642359bbf1' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('0a6dc4a4-6e79-5713-88af-de3c69170bfe' AS UUID), 'seed-channel:0a6dc4a4-6e79-5713-88af-de3c69170bfe', '0a6dc4a4-6e79-5713-88af-de3c69170bfe@catalog.invalid', 'Antònia Font', CAST('2012-10-08T07:53:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2012-10-08T07:53:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('0a6dc4a4-6e79-5713-88af-de3c69170bfe' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), 'Alegria', 'Videoclip oficial d''Alegria d''Antònia Font. Un dels temes del disc Alegriai (Virgin/Drac; 2002)', 21, '/media/b87c1fbe-42ad-5f35-a38d-1e243563d031/thumbnail.webp', '/media/b87c1fbe-42ad-5f35-a38d-1e243563d031/video.mp4', CAST('0a6dc4a4-6e79-5713-88af-de3c69170bfe' AS UUID), 1056693, 4708, CAST('2012-10-08T07:53:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c155376f-5195-5685-82c0-cc66667e3271' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'joanguillemponsmarroquin8530', 'Bona gent', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c155376f-5195-5685-82c0-cc66667e3271' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2cb93dd5-3481-5128-988f-3d0303a5814f' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'JF-dq4vh', 'Fuisteis mi infancia, en aquellas mañanas de clase en Mallorca, nunca os olvidaré. Os amo(Lima, Perú 📍)', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2cb93dd5-3481-5128-988f-3d0303a5814f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ef2280c7-9712-505e-ad34-3d968947268a' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'JF-dq4vh', 'Te amo', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ef2280c7-9712-505e-ad34-3d968947268a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('41e5e0b2-056d-5d7a-890f-b7ff00c62e62' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'Tomassa-26', 'Antònia Font. 
Per totes ses vegades que mos heu emocionat. 
Grà6!', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('41e5e0b2-056d-5d7a-890f-b7ff00c62e62' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3f6d7f90-6862-5ded-9217-cddc54fdbe68' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'fatimacamilo100', '❤', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3f6d7f90-6862-5ded-9217-cddc54fdbe68' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0dc391ab-1828-5693-9abf-d1f4cc416381' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'fatimacamilo100', '❤', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0dc391ab-1828-5693-9abf-d1f4cc416381' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6b86e22e-7b61-5035-92f5-832c0a8b68dd' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'nonjalourdess263', 'Nice video also… guess it was in Tenerife??? Hermoso', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6b86e22e-7b61-5035-92f5-832c0a8b68dd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3a931bca-e632-51ae-9e72-aae69653bf27' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'JimmagiX', 'Idoi no la escolteu si no vos agrada 🤟 i callau cap de fabes !!  Aixo es historia de sa nostra roqueta! Aaaaleeegria
2025 - Mallorca
Aixi va de bo', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3a931bca-e632-51ae-9e72-aae69653bf27' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6c152f2c-fe38-5297-8813-c5fd28b34454' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'cescfontvela8330', 'Memociona molt❤❤❤❤', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6c152f2c-fe38-5297-8813-c5fd28b34454' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('73b80ecf-3974-5351-b14e-4a6dead5e38d' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'montserratbonalsbarbera188', 'Em fa sentir pau i emocio', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('73b80ecf-3974-5351-b14e-4a6dead5e38d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b1272d01-5e4b-5271-a654-a835e29be9d1' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'diegoriveravargas3889', 'Cuando pongo los 40 principales tocan esa cancion.', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b1272d01-5e4b-5271-a654-a835e29be9d1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1aece555-94c7-5be0-aee0-10e83594be1c' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'musica-bu4bm', 'Com a la teva canco, alegria per a tothom!!', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1aece555-94c7-5be0-aee0-10e83594be1c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9e7e3c99-381a-5cb8-bcd5-7297a2d13a7d' AS UUID), CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID), NULL, 'jorgerejaslopez6854', 'Increible cancion , tanta gente que queremos ser libres', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9e7e3c99-381a-5cb8-bcd5-7297a2d13a7d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b87c1fbe-42ad-5f35-a38d-1e243563d031' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), 'Wa Yeah!', 'Videoclip oficial de Wa Yeah! d''Antònia Font. Un dels temes del disc Batiscafo Katiuscas (Discmedi; 2006) dirigit per Antonio Lara.', 22, '/media/2d78d6d2-55a4-5ca1-a44e-d0660aabc448/thumbnail.webp', '/media/2d78d6d2-55a4-5ca1-a44e-d0660aabc448/video.mp4', CAST('0a6dc4a4-6e79-5713-88af-de3c69170bfe' AS UUID), 832876, 2977, CAST('2012-10-07T16:09:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e1d2a6ff-81fc-5b51-b463-e75d3ae44f14' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'obessiveforest_', 'De petita el meu pare em posava aquesta cançó, i encara ara que m''he fet gran em segueix encantant.', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e1d2a6ff-81fc-5b51-b463-e75d3ae44f14' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('59250c02-4e52-57a4-8143-c5aa449f69b6' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'rafelfrasquito7233', 'Algú en 2026?', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('59250c02-4e52-57a4-8143-c5aa449f69b6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f448e3db-6122-5288-832f-5872f78a0420' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'AlexanderaCapdevila', 'Presidents de França TB 💕', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f448e3db-6122-5288-832f-5872f78a0420' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('55d4e173-af91-5c84-bf72-7332b335df0a' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'AlexanderaCapdevila', 'L article Salat ❤ love 💕', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('55d4e173-af91-5c84-bf72-7332b335df0a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6a94b1a0-62a0-5713-84e8-752a891974c9' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'joaquinasolesole76', 'Que bonic com es dóna "vermella" amb mallorquí.', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6a94b1a0-62a0-5713-84e8-752a891974c9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4e658349-751d-5c00-8a10-04acf31bc44f' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'joaquinasolesole76', 'Optimisme en vena.
Alegria de viure.
❤❤❤❤❤❤❤❤
Us estimo molt', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4e658349-751d-5c00-8a10-04acf31bc44f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('05f3548d-37ea-5dbd-8968-300eeae0c13c' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'montsepoch157', 'El llapis d''ikea 🎉😊', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('05f3548d-37ea-5dbd-8968-300eeae0c13c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('271970b1-ee22-5177-bb9b-15855b5628bd' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'desamparadosramon9159', 'Precios, a munt les nostres tradicions❤', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('271970b1-ee22-5177-bb9b-15855b5628bd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('60fb68bf-de62-513f-b0c1-7005af20e9da' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'Maria-py9lw', 'Passió', NULL, CAST('2025-10-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('60fb68bf-de62-513f-b0c1-7005af20e9da' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6917a4e8-af07-5024-a8c4-60bdb3fde35c' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'chainb03', '❤❤❤ ❤❤❤  wa  YAAAA', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6917a4e8-af07-5024-a8c4-60bdb3fde35c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7d7fa091-794a-57cf-aa01-e548dcd4b9a5' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'anabelpl3758', 'Sencillamente me encanta esta canción. 🥰❤️👏🏻👏🏻', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7d7fa091-794a-57cf-aa01-e548dcd4b9a5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1dd02177-8fff-50da-a94c-96b14f459481' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'Atope-m9x', 'Vaja temarral del quinze! O del setze, no sé l '' any 😆😄', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1dd02177-8fff-50da-a94c-96b14f459481' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a3c8c611-d65a-54cb-bfd5-1857c7c357ec' AS UUID), CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID), NULL, 'davidmarti6631', 'La millor', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a3c8c611-d65a-54cb-bfd5-1857c7c357ec' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2d78d6d2-55a4-5ca1-a44e-d0660aabc448' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), 'Viure Sense Tu', 'Provided to YouTube by The Orchard Enterprises

Viure Sense Tu · Antònia Font

Antònia Font

℗ 2002 Produccions Blau

Released on: 2008-06-26

Auto-generated by YouTube.', 28, '/media/2175fb42-bc45-57eb-850b-cd21b9343392/thumbnail.webp', '/media/2175fb42-bc45-57eb-850b-cd21b9343392/video.mp4', CAST('0a6dc4a4-6e79-5713-88af-de3c69170bfe' AS UUID), 923359, 3063, CAST('2014-11-20T14:39:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('10360b67-df87-57ea-ae2d-eff12a641dab' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'zuhairomar3133', 'Dolça besada
Té gust de que s''acaba
Punt i principi
De viure sense tu
Jo no sabia que també me donaries
Manuals de geografia
Cent dilluns os a un dibuix
Jo què sabia d''alens que es trobaven
De cabells que s''embullaven
De mans i de perfums
Dolça besada
Té gust de que s''acaba
Punt i principi
De viure sense tu
Jo no sabia que en sa nit me tastaries
Eren gustos que nedaven
Entre boques i racons
Jo no sabia que després me mataria
Sa teva mirada
Que plora i diu que no
I arriba un dia que sa vida és un teatre
Que se diu felicitat
Primavera i trinaranjus
Amb qui més has estimat
Te regal sa meva vida
I sense tu ja no me val
I s''horabaixa la deixam passar i me mires
Tan a prop que me fa mal
Que surt es sol i encara plou
Que t''estim massa i massa poc
Que no sé com ho hem d''arreglar
Que som amics, que som amants
Dolça besada
Té gust de que s''acaba
Punt i principi
De viure sense tu
Jo no sabia que també me donaries
Manuals de geografia
Cent dilluns os a un dibuix
Jo què sabia d''alens que es trobaven
De cabells que s''embullaven
De mans i de perfums
Jo no sabia que en sa nit me tastaries
Eren gustos que nedaven
Entre boques i racons
Jo no sabia que després me mataria
Sa teva mirada
Que plora i diu que no
I arriba un dia que sa vida és un teatre
Que se diu felicitat
Primavera i trinaranjus
Amb qui més has estimat
Te regal sa meva vida
I sense tu ja no me val
I s''horabaixa la deixam passar i me mires
Tan a prop que me fa mal
Que surt es sol i encara plou
Que t''estim massa i massa poc
Que no sé com ho hem d''arreglar
Que som amics, que som amants
I arriba un dia que sa vida és un teatre
Que se diu felicitat
Primavera i trinaranjus
Amb qui més has estimat
Te regal sa meva vida
I sense tu ja no me val
I s''horabaixa la deixam passar i me mires
Tan a prop que me fa mal
Que surt es sol i encara plou
Que t''estim massa i massa poc
Que no sé com ho hem d''arreglar
Que som amics, que som amants
Dolça besada
Té gust de que s''acaba
Punt i principi
De viure sense tu', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('10360b67-df87-57ea-ae2d-eff12a641dab' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9b06b874-7965-5604-a3ab-e809a1e0c0e5' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'user-ff6zj4ck3i', 'Molt bonica i estiuenca❤ m''encanta', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9b06b874-7965-5604-a3ab-e809a1e0c0e5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('91fead23-e6c6-5aa1-a4fb-a4c476a4d9a4' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'Elaiori', 'Sé que amb tu vaig directa al precipici.
Que som amics, que som amants...', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('91fead23-e6c6-5aa1-a4fb-a4c476a4d9a4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f98c9c5d-6bc8-58cc-b611-f323f8ea355f' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'Elaiori', 'M''estimo massa a mi mateixa com per a caure pel precipici per culpa teva. 
Per això, faig dues passes enrere i me''n torno a ser qui era jo abans de coneixe''t.', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f98c9c5d-6bc8-58cc-b611-f323f8ea355f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9bcbe8e6-e99f-58ab-8843-3497006b3731' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'Elaiori', 'I ja és ple estiu i encara donem voltes entreveient l''inevitable final.', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9bcbe8e6-e99f-58ab-8843-3497006b3731' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3337bc4e-e373-59ab-aa30-e3251aea833d' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'Elaiori', 'I encara no sé com tancar tot això.
Ni estic bé amb tu ni sense tu...', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3337bc4e-e373-59ab-aa30-e3251aea833d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('49068cf3-1c53-5cfc-8f4d-3a979c168d31' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'Elaiori', 'I l''any s''acaba i ja no sé com acabarem tu i jo, si amics, si amants...', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('49068cf3-1c53-5cfc-8f4d-3a979c168d31' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3b5e2c7f-e4b0-587f-9a46-3a2f66132e74' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'Elaiori', 'Tu encara amb els teus dubtes i pors i jo, un any després, ja no sé ni qui sóc.', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3b5e2c7f-e4b0-587f-9a46-3a2f66132e74' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f43245b4-3b43-5b93-9e87-479e2b7bf9ea' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'Elaiori', 'L''estiu va passant i nosaltres seguim aquí, sense mar de fons, només deixant-nos endur per les onades.', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f43245b4-3b43-5b93-9e87-479e2b7bf9ea' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e8ae192e-8184-5b02-a559-a1657c3149ee' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'marseillevalencia', 'Primavera i Trinaranjus❤', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e8ae192e-8184-5b02-a559-a1657c3149ee' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('841392e5-3ea4-5a27-8ed7-bd34be4ef35a' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'ainhoaalarcon7293', 'Mes o menys que dic es una cacota😂😂😂🆘🆘🆘🚽🚽💥💥🤛🆘🆘🆘🆘🤣🤣🤬🤬🤮🤢🤑👈👉👉👈uwu', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('841392e5-3ea4-5a27-8ed7-bd34be4ef35a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c27c6d07-3e74-546d-b9e1-1db639615224' AS UUID), CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID), NULL, 'wxqrii', 'pay gorn', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c27c6d07-3e74-546d-b9e1-1db639615224' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2175fb42-bc45-57eb-850b-cd21b9343392' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('99343eea-d122-52d6-bd29-f34224a2ad28' AS UUID), 'seed-channel:99343eea-d122-52d6-bd29-f34224a2ad28', '99343eea-d122-52d6-bd29-f34224a2ad28@catalog.invalid', 'Música Global', CAST('2010-07-09T11:41:48.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2010-07-09T11:41:48.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('99343eea-d122-52d6-bd29-f34224a2ad28' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID), 'Lax''n''Busto- Més que la meva sang', 'Lax''n''Busto- Més que la meva sang', 27, '/media/51af6ee7-cf35-5bca-a1d9-af859b60b79e/thumbnail.webp', '/media/51af6ee7-cf35-5bca-a1d9-af859b60b79e/video.mp4', CAST('99343eea-d122-52d6-bd29-f34224a2ad28' AS UUID), 1512279, 4018, CAST('2010-07-09T11:41:48.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5cfae16e-7b37-5179-ad4e-76a6e27ba574' AS UUID), CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID), NULL, 'silviasm6670', 'El millor grup de rock catala 🫶', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5cfae16e-7b37-5179-ad4e-76a6e27ba574' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fb3af9a5-4e6f-5b8e-91fb-acc5446162aa' AS UUID), CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID), NULL, 'nurimoline6393', 'Voldria en castellà per un amic. Pot sé?.', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fb3af9a5-4e6f-5b8e-91fb-acc5446162aa' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('51af6ee7-cf35-5bca-a1d9-af859b60b79e' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('71f2a450-0a7c-5f47-92c1-0c24554ebe79' AS UUID), 'seed-channel:71f2a450-0a7c-5f47-92c1-0c24554ebe79', '71f2a450-0a7c-5f47-92c1-0c24554ebe79@catalog.invalid', 'discmedilaxnbusto', CAST('2011-04-20T09:53:16.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2011-04-20T09:53:16.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('71f2a450-0a7c-5f47-92c1-0c24554ebe79' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID), 'Lax ''n'' Busto - Llença''t', '', 22, '/media/82adf269-b9e0-57c3-9b24-fccff8a0fc9d/thumbnail.webp', '/media/82adf269-b9e0-57c3-9b24-fccff8a0fc9d/video.mp4', CAST('71f2a450-0a7c-5f47-92c1-0c24554ebe79' AS UUID), 1504041, 6825, CAST('2011-04-20T09:53:16.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('60b155e7-53c3-5b72-9b7e-db0c08e31387' AS UUID), CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID), NULL, 'bufalorepublicano2161', 'Euskal Herritik entzuten, zuen musika eta kultura errespetatzen anai katalanak', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 7
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('60b155e7-53c3-5b72-9b7e-db0c08e31387' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7de1a17e-e724-5375-b54c-37b91da38ef3' AS UUID), CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID), NULL, 'cascossi809', 'Jo diria que dels millors vídeoclips que s''han fet en català.', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7de1a17e-e724-5375-b54c-37b91da38ef3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ac0d0061-cf8a-5b90-a41a-1734ce57487a' AS UUID), CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID), NULL, 'Néstor44-e4g', 'M''encanta!', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ac0d0061-cf8a-5b90-a41a-1734ce57487a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c28c5b51-9a21-599b-b021-1b21f2e903a3' AS UUID), CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID), NULL, 'freezeploit', 'Esto lo ponian como timbre en mi vieja escuela ❤', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c28c5b51-9a21-599b-b021-1b21f2e903a3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9d6429cd-2857-5653-93e8-e47b12bed106' AS UUID), CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID), NULL, 'thevideomakerofdjs', 'Que recuerdos..yo me enamoré de una de las chicas que vino a bailar a mi bar de Cambrils....pero no pudo ser...uno de mis amores platónicos', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9d6429cd-2857-5653-93e8-e47b12bed106' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6972cacf-4318-5626-bd5d-2190c73dc420' AS UUID), CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID), NULL, 'Germinal957', 'Pauleta...aún lo recuerdo...El Raval siempre....en el Ámbar...parece que fue ayer.', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6972cacf-4318-5626-bd5d-2190c73dc420' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('82adf269-b9e0-57c3-9b24-fccff8a0fc9d' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), 'Lax ''n'' Busto - Miami Beach', '', 29, '/media/b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf/thumbnail.webp', '/media/b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf/video.mp4', CAST('71f2a450-0a7c-5f47-92c1-0c24554ebe79' AS UUID), 563325, 1629, CAST('2011-04-20T07:40:28.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9be412f6-307c-580d-8051-7f56629ca8ad' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'montseroig2369', 'Quànta raó que tenien.... Hollywood fà anys que s''ha rendit a nosatros!!!!! Fins i tot Joc de Trons han gravat aquí!!!!!', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9be412f6-307c-580d-8051-7f56629ca8ad' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('11891f70-afd4-5e96-8755-9b6dd64631bf' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'montserratrecheibanez6714', 'Aquest estiu me n vaig a veure ls a Vilafranca❤❤', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('11891f70-afd4-5e96-8755-9b6dd64631bf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('38b46b3b-d5ae-5859-9aa9-52b58e0c74ae' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'silviasm6670', 'Els millors🫶', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('38b46b3b-d5ae-5859-9aa9-52b58e0c74ae' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4ebeb9f0-6de3-53da-a6bb-9028431b7f61' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'adriafont6460', 'quan era un adolescent aquesta canço ho petaba...com ara', NULL, CAST('2026-04-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4ebeb9f0-6de3-53da-a6bb-9028431b7f61' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('38383b32-5b15-5838-b76b-20f48354494e' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'vanessanoemi6203', 'Que bona aquesta! I mira, tot Hollywood aquí... que els fotin fora a tots!', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('38383b32-5b15-5838-b76b-20f48354494e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('53542676-d78d-5acd-8862-86cf377d3e43' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'cristinaalvarez-rh2eo', '❤🎉', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('53542676-d78d-5acd-8862-86cf377d3e43' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d33a13af-8794-542f-94a7-f4d3427c090c' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'TheErevuelta1', 'Vaya temazo', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d33a13af-8794-542f-94a7-f4d3427c090c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a96d9f4f-6865-5e5b-9e59-70a06be0cf26' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'PedroTalavera-hv2pz', 'Que buenos son!!!. Y lo digo porque este 2025 vuelven a hacer conciertos y allí estaré 😍', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 11
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a96d9f4f-6865-5e5b-9e59-70a06be0cf26' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0f361a6b-9cf7-5dc4-86f9-dedbaf81cfdd' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'entretots', 'Soc argenti, novo fan de la banda !! Visca Cataluña ❤', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 14
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0f361a6b-9cf7-5dc4-86f9-dedbaf81cfdd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b64fbf32-bb84-586c-aeb9-013e41f4924e' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'albertvidal9807', 'A mi m''agrada molt', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b64fbf32-bb84-586c-aeb9-013e41f4924e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('98e0f81b-09c7-587b-bd6b-2f6a5fc65b86' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'jordividal1975', 'Torne''n gira 2025 ❤❤❤❤❤❤', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 7
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('98e0f81b-09c7-587b-bd6b-2f6a5fc65b86' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f487b11b-51b6-5b0c-a0b1-f3160c0b8b89' AS UUID), CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID), NULL, 'mararrufat946', '💪💪💪💪💪💪💪💪💪💪💪', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f487b11b-51b6-5b0c-a0b1-f3160c0b8b89' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('b5dc2e8c-e3aa-5518-b9fe-de6de9a0bbdf' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), 'Ed Sheeran - Beautiful People (feat. Khalid) [Official Music Video]', 'The official music video for Ed Sheeran - Beautiful People (feat. @khalid)
 
Taken from No.6 Collaborations Project released in 2019, which featured the hit singles ''I Don''t Care'', ''Cross Me'', ''Beautiful People'', ''Blow'', ''Best Part of Me'', ''Antisocial'', ''South of the Border'' &''Take Me Back To London''. 
 
Subscribe to the Ed Sheeran channel for all the best and latest official music videos, behind the scenes and live performances.  
http://bit.ly/SubscribeToEdSheeran 
 
See more official videos from Ed Sheeran here: 
https://www.youtube.com/watch?v=ryJgDL9jzKk&list=PLjp0AEEJ0-fGKG_3skl0e1FQlJfnx-TJz 

Listen to more from the No. 6 Collaborations Project here : 
https://www.youtube.com/playlist?list=PLjp0AEEJ0-fHZDWhxhKo0wG08bMUcRy3l
 
Follow Ed Sheeran on: 
Instagram: http://instagram.com/teddysphotos
TikTok: https://www.tiktok.com/@edsheeran
Facebook: http://www.facebook.com/EdSheeranMusic
Twitter: http://twitter.com/edsheeran
Discord: http://discord.gg/edsheeran
Official Website: http://edsheeran.com 

About Ed Sheeran: 
Ed Sheeran may be the quintessential pop star of the 2010s: an internationally acclaimed, multi-award winning singer/songwriter who seems to acknowledge no boundaries between styles or eras with elements of folk, hip-hop, pop, dance, soul, and rock woven throughout his music. 

His incredible catalogue includes the studio albums ‘+’ (plus), ‘x’ (multiply) and ‘÷’ (divide) which spawned hit singles such as ‘The A team’ , ’Lego House’, ‘Sing'', ‘Thinking Out Loud’, ‘Photograph’, ‘Shape Of You’, ‘Castle on The Hill’ and ‘Perfect’. 
 
In 2019, Ed Sheeran released the genre-spanning ‘No.6 Collaborations Project’ which featured a wide-range of artists including ‘Justin Bieber’, ‘Camilla’ Cabello’, ‘Travis Scott’, ‘Eminem’, ‘Cardi B, ‘Paulo Londra’, ‘Bruno Mars’ and ‘Stormzy’ amongst many others, producing hits such as ‘I Don’t Care’, ‘Beautiful People’, ‘South of The Border’ and ‘Take Me Back To London’. 
 
#EdSheeran #Khalid #BeautifulPeople', 21, '/media/ac5fbf20-b584-5e08-9284-f6544fca59e1/thumbnail.webp', '/media/ac5fbf20-b584-5e08-9284-f6544fca59e1/video.mp4', CAST('2ba82f4f-dcff-50a6-a6f9-561488e33797' AS UUID), 394727232, 2925684, CAST('2019-06-28T07:00:05.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('deae2d12-ff84-5c68-ba94-2648e4c50b0b' AS UUID), CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), NULL, 'Jobby-x5w', 'Rhythm already in my DNA. Even my kids will love it', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('deae2d12-ff84-5c68-ba94-2648e4c50b0b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c59f9952-703e-5620-9afc-2cc9aff725d3' AS UUID), CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), NULL, 'RedmiA1-y3d', '👻👻👻👻👻👻🕳️🕳️🕳️', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c59f9952-703e-5620-9afc-2cc9aff725d3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6ba338e0-ac43-5067-ae3a-e7e7f9ba03ad' AS UUID), CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), NULL, 'AasthaSingh-y9u', 'Heard this randomly in a cafe playing and I had forgotten how much I used to love this song back in 6th grade. Golden times back then before Covid. It evokes a very weird nostalgic sense that makes me wanna cry but enjoy too.', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6ba338e0-ac43-5067-ae3a-e7e7f9ba03ad' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c6ad4f8f-2289-51d5-ad95-7fff1f75b390' AS UUID), CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), NULL, 'アンプロウド', '日本から応援しています、エドが大好きです', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c6ad4f8f-2289-51d5-ad95-7fff1f75b390' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('877582f4-9737-554e-a154-8ac9b8b3f266' AS UUID), CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), NULL, 'Chig122', '7 years later, still one of my favourite songs', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('877582f4-9737-554e-a154-8ac9b8b3f266' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('15ff4efa-b420-5dcf-9237-8c32357e8dec' AS UUID), CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), NULL, 'OceanDriftPulse', 'Who is still listening this song in 2026?', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('15ff4efa-b420-5dcf-9237-8c32357e8dec' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f74dce98-1553-5d52-906a-5eaf843b8bf9' AS UUID), CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), NULL, 'SRM30', 'Hey Ed... we are here for you. Life goes on my friend. All the bullshit aside. ❤', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f74dce98-1553-5d52-906a-5eaf843b8bf9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fda27645-8ef4-59df-80e3-1eccef449dab' AS UUID), CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID), NULL, 'amandabell7980', 'We are all beautiful souls 💕 and very ordinary People''s beautiful people''s living life journey 🙏💯💪', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fda27645-8ef4-59df-80e3-1eccef449dab' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ac5fbf20-b584-5e08-9284-f6544fca59e1' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('a568d4d1-4d65-5caf-8d14-629bd27db343' AS UUID), 'seed-channel:a568d4d1-4d65-5caf-8d14-629bd27db343', 'a568d4d1-4d65-5caf-8d14-629bd27db343@catalog.invalid', 'TVNorge', CAST('2013-09-03T13:24:54.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2013-09-03T13:24:54.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('a568d4d1-4d65-5caf-8d14-629bd27db343' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), 'Ylvis - The Fox (What Does The Fox Say?) [Official music video HD]', 'Watch I kveld med Ylvis on discovery+: http://bit.ly/IKveldMedYlvis
New Ylvis video! https://youtu.be/Smeqw0qoYBw 
iTunes: http://smarturl.it/YlvisFox

Ylvis - [Official music video playlist HD]: http://www.youtube.com/watch?v=jofNR_WkoCE&list=PLfNe3nGQENtP3VCn1t1pybju9ffSPBohU

Buy or stream the song here:
iTunes: http://smarturl.it/thefox-itunes
Spotify: http://smarturl.it/thefox-spotify
WiMP: http://smarturl.it/thefox-wimp

Music video from the Norwegian talk show I kveld med YLVIS.

http://www.facebook.com/IkveldmedYLVIS?fref=ts

Music by M.Eriksen/T.E.Hermansen/V.Ylvisåker/B.Ylvisåker
Lyrics by V.Ylvisåker/B.Ylvisåker/C.Løchstøer
Produced by Stargate
Choreographer: Thea Bay 

#ylvis #thefox #whatdoesthefoxsay

SBS Discovery © 2013', 29, '/media/bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10/thumbnail.webp', '/media/bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10/video.mp4', CAST('a568d4d1-4d65-5caf-8d14-629bd27db343' AS UUID), 1208811739, 9099448, CAST('2013-09-03T13:24:54.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), 'ENTERTAINMENT'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND category = 'ENTERTAINMENT') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5cd5337a-761d-527a-872c-0dd808edd179' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'tvnorge', 'Wow! Thank you all so much for the amazing feedback we''ve gotten from you on "Ylvis - the Fox" the passed days guys! Keep on viewing, the fox is still out there! Also feel free to tune in to the Ylvis - [Official music video playlist HD] for more Ylvis moments! Enjoy!', NULL, CAST('2013-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 104000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5cd5337a-761d-527a-872c-0dd808edd179' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('227b03d6-ad00-5ffa-ae81-826bf4381729' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'Sarah-un1mp', 'Thanks', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 22
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('227b03d6-ad00-5ffa-ae81-826bf4381729' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a7e1942d-8022-5fd1-8364-6b22be59f7d3' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'FishinwitZach', 'TVNorge 
Im', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 10
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a7e1942d-8022-5fd1-8364-6b22be59f7d3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('44e4dfec-0f75-53f7-9ccf-62fa0faddfe8' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'Kuri0', 'Epic', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 8
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('44e4dfec-0f75-53f7-9ccf-62fa0faddfe8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f718a8d4-bcbd-519c-8876-6953427ab9f7' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'tracyboyko7507', 'I love you', NULL, CAST('2019-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 8
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f718a8d4-bcbd-519c-8876-6953427ab9f7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fb44ac87-08c3-585f-abd7-808fe6946c61' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'hakunahhhmatata', ' @tracyboyko7507  Brother....um... 🙏🙏', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fb44ac87-08c3-585f-abd7-808fe6946c61' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('51f047cf-2c8d-572d-8209-5c06d456c491' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'Freddiick', 'Ok, you don’t have to believe me, but when I was 8 (or when this song came out) my mother was scrolling through Facebook, and ya know this was before the songs was famous. And she came across this song! And so she shared it and then the phase happened. Same with Gangnam Style. No cap.', NULL, CAST('2020-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 49
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('51f047cf-2c8d-572d-8209-5c06d456c491' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d99fdea1-b3aa-5503-913f-52e2773a975d' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'emilymarielovesJB', ' @Freddiick 𝚘😊', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d99fdea1-b3aa-5503-913f-52e2773a975d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ccb232fd-50f5-5767-a9aa-2459cf8c1222' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, '1.kendallThomas', '​FNAF12345💔💔💔💔💔💔💔💔💔🐶🐴🐘🐯willy🖕🖕🖕🖕🖕🖕🖕🖕👿👿👿👿👿👿👿👿🖕🖕🖕🖕🖕🖕🖕🖕🖕🖕🖕🖕💔💔💔💔💔💔💔🤬🤬🤬🤬🤬🤬🤬🤬🤬🤬🤬🤬🌛👅👿🤬🤬🤬🤬🤬🤬🤬🤬🤬🤬👅👿🖕🚫🌍🔒😊', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ccb232fd-50f5-5767-a9aa-2459cf8c1222' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('696fa4f4-5a14-5bfd-b576-c70accb49e20' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, '1.kendallThomas', 'FNAF12345💔💔💔💔💔💔💔💔💔💔🐶🐯🐘🐴willy👿👿👿👿👿👿🤬🤬🤬🖕🖕🖕🖕🖕🖕🖕🖕💔🖕🖕🖕🖕🖕🖕🖕🖕🖕🖕🖕🖕🖕🖕👿🖕👅🖕🚫🌍🔒', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('696fa4f4-5a14-5bfd-b576-c70accb49e20' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('79cc3e9a-c9e0-53dd-96d2-93dbf270d972' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'sajidibnhashim5771', '​"No cap"? 
Was ist das?  ... Bitte.', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('79cc3e9a-c9e0-53dd-96d2-93dbf270d972' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b54ef235-1399-5740-8445-db455b65f15e' AS UUID), CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID), NULL, 'gamer_or_not', ' @sajidibnhashim5771   cap means lying.', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b54ef235-1399-5740-8445-db455b65f15e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bbb096b7-fede-5e1f-aa1f-b95a1d7e2a10' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('f4347984-6c31-5419-b7e4-bec40724cb90' AS UUID), 'seed-channel:f4347984-6c31-5419-b7e4-bec40724cb90', 'f4347984-6c31-5419-b7e4-bec40724cb90@catalog.invalid', 'The Key of Awesome', CAST('2012-06-03T04:49:47.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2012-06-03T04:49:47.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('f4347984-6c31-5419-b7e4-bec40724cb90' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID), 'Maroon 5 Payphone PARODY: Game of Thrones! Key Of Awesome #59', 'Adam Levine is quitting Maroon 5 because he can''t stop watching Game of Thrones!  See the original: http://www.youtube.com/watch?v=5FlQSQuv_mg

Check out our second Channel!  http://bit.ly/xtPqZI
Subscribe to Awesome!  http://bit.ly/y2zUpn

Subscribe to BarelyPolitical!
http://www.youtube.com/subscription_center?add_user=barelypolitical

Subscribe to Awesome!
http://www.youtube.com/subscription_center?add_user=awesome

The Key of Awesome Website!
http://www.thekeyofawesome.com

KOA Facebook!
http://www.facebook.com/thekeyofawesome

Mark''s Channel: http://bit.ly/xZxp0Q
http://twitter.com/markdouglas73

Todd''s Channel: http://bit.ly/ykTswv
http://www.twitter.com/toddwomack

Music Produced by Deep V Music:
http://www.deepvmusic.com
http://fb.com/ihatedeepvmusic
http://www.youtube.com/DeepVMusicSucks

Get the songs on iTunes!
http://itunes.apple.com/us/album/the-key-awesome-deluxe-edition/id374349910

Subscribe to the Newsletter of Awesome!
http://eepurl.com/iKFpr

TShirts!
http://thekeyofawesome.spreadshirt.com

Follow us on Twitter
http://www.twitter.com/BPTweeted
https://twitter.com/#!/thekeyofawesome

Write us a letter!
The Key of Awesome
P.O. Box 30921 New York, NY 10011

LYRICS:
Watching Game of Thrones I haven''t left home
Told everyone that I had the flu
It''s an obsession I''m filled with depression
cus it''s the end of season two
Now, my, friends all tell me that I''ve lost my grip on reality
They tell me it''s just a nerd show, but Dragons are real to me
Some day those dragons will be grown
Daenerys will be my queen
and when we reclaim the throne you
won''t be allowed in our house
Don''t call me at nine
On a Sunday Night
I don''t care who died
I''m filling my mind with sword fights, and quests, horse lord, and incest. When Ned died I cried
Watching Game of Thrones its like a black hole
Wanna kill Joffrey with his own shoes
Magical kingdoms with naked women
and none of them have silicon boobs
And If the seven kingdoms did exist
I would drink and party with that imp
Viserys had gold poured onto his head
He''s no fucking dragon now he''s dead
Ouch
I''ll sick my dierwolf on ya
If you get in my way
He''s actually a chihuahua
But he''ll still rip off your face
I only leave my apartment
to put the rent in the mail
That''s right I still pay my bills cus
Lannister''s repay their debts
I''m joining the Knights Watch It''s my birthright
I''ll stand watch for WhiteWalkers in the snow. 
This Wall kind of blows
No hot chicks, just bros and old crusty guys
Watching Game of Thrones
I feel bad for John Snow
It seems like he''s always getting screwed
Gave up on Mad Men cus nothing happens except for when Don''s wife sang Zou bisou
The Lannisters all look like Surfer dicks
Jamie banged his sister she''s a bitch
No one knows that King Joeffrey''s their kid
Except for maybe Peter Dinklage
this is best role
RAP:
This is nothing but nerd shit
You better get a damned grip and go outside and get some fresh air
Get your fat butt un-stuck from the chair ain''t a dragon slayer just a loser in your underwear Wait a second did I just see a pair boobs
If you don''t mind I''m gonna chill for a few with you
Dude, why is that girl pretending she a boy yo?
Oh shit that witch just give birth to a cloud of smoke!
How''d that hot naked blond chick survive the fire
Isn''t Mayor Carcetti from the Wire
I apologize for being so shitty before
This show is Lord of the Rings but with titties galore
But I''m sure who I''m supposed to root for
I like Rob Stark but I like the dwarf more
Call my manager and cancel my tour I gotta read A Storm of Swords
Oh Theon Greyjoy you were a nice boy
til you had those two kids barbequed
Winter Is coming I''m not sure what that means but you can bet it''s probably bad news
I''m not playing music anymore
From now on you can just be Maroon 4
Next time they do they The Voice I won''t be there
Tell Ceelo his cat can have my chair
Cus I''m stuck in Game of Thrones', 25, '/media/589a10db-e62f-572a-9565-d69416c28a38/thumbnail.webp', '/media/589a10db-e62f-572a-9565-d69416c28a38/video.mp4', CAST('f4347984-6c31-5419-b7e4-bec40724cb90' AS UUID), 9422728, 76109, CAST('2012-06-03T04:49:47.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID), 'ENTERTAINMENT'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID) AND category = 'ENTERTAINMENT') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('58d440ee-949b-5b3d-8910-c2d6c94b85de' AS UUID), CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID), NULL, 'kyleharris7142', 'No idea why this song popped up in my mind but I''m so glad it did. What a throwback 😊', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('58d440ee-949b-5b3d-8910-c2d6c94b85de' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f8518660-51a5-523f-84b1-56c4c22e6104' AS UUID), CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID), NULL, 'JohnLeathers-o6w', 'Oh for 5 sureeee😮', NULL, CAST('2026-09-19T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f8518660-51a5-523f-84b1-56c4c22e6104' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('942d27e0-a3ca-58a8-8cac-b5cddbf669c3' AS UUID), CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID), NULL, 'LudosRex1933', 'Dont tell him about season 8.', NULL, CAST('2026-09-02T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('942d27e0-a3ca-58a8-8cac-b5cddbf669c3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e55bebca-b5a8-54d3-b1f8-5e75a4dc8c03' AS UUID), CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID), NULL, 'justinChalo', 'Came back in 2026 😂', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e55bebca-b5a8-54d3-b1f8-5e75a4dc8c03' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8cc449a4-016a-5fa9-8871-ccac6e2e0398' AS UUID), CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID), NULL, 'greenyenergy', 'Jon Snow got screwed in the ending as well.', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8cc449a4-016a-5fa9-8871-ccac6e2e0398' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d1a298a6-5741-57fa-9590-55a906405316' AS UUID), CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID), NULL, '46Q_7', 'FUCKING LOVE THIS BANGER STILL', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d1a298a6-5741-57fa-9590-55a906405316' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('589a10db-e62f-572a-9565-d69416c28a38' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('4f023ee8-5cbb-5091-ac09-ae6cb7d1287d' AS UUID), 'seed-channel:4f023ee8-5cbb-5091-ac09-ae6cb7d1287d', '4f023ee8-5cbb-5091-ac09-ae6cb7d1287d@catalog.invalid', 'JAŸ-Z', CAST('2021-12-04T05:00:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2021-12-04T05:00:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('4f023ee8-5cbb-5091-ac09-ae6cb7d1287d' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), 'JAŸ-Z - Empire State Of Mind ft. Alicia Keys', 'Official music video for "Empire State Of Mind" performed by JAY-Z featuring Alicia Keys. 

Listen to JAY-Z: https://JAY-Z.LNK.TO/JAYZ
 
Follow JAY-Z:
https://www.twitter.com/SC
https://www.facebook.com/JAYZ
https://www.instagram.com/JAYZ

Music video by JAY-Z performing Empire State Of Mind. © 2014 S. Carter Enterprises, LLC., Distributed by Roc Nation Records, LLC.', 26, '/media/f4c6bbb4-28cc-5361-a632-e82ac79db0e3/thumbnail.webp', '/media/f4c6bbb4-28cc-5361-a632-e82ac79db0e3/video.mp4', CAST('4f023ee8-5cbb-5091-ac09-ae6cb7d1287d' AS UUID), 521284184, 3139587, CAST('2021-12-04T05:00:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f4f404e8-85bc-5d18-be82-853c1eee017d' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'RogerLincar', '🙏.', NULL, CAST('2026-09-30T10:49:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f4f404e8-85bc-5d18-be82-853c1eee017d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5238529d-15af-56fc-b182-66cb02349720' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'neaituppi13713', 'Okay, I just watched Men in black 3, and heard this once. Complete here. It sounds good, but I got everything that was in it, in one listen.', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5238529d-15af-56fc-b182-66cb02349720' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2a9c905d-268a-5756-a0b7-73ef3ab9918e' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'craigbaetge4193', '2026 ❤', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2a9c905d-268a-5756-a0b7-73ef3ab9918e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a5023263-7f65-5cd5-bdd7-658950917e07' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'javierchavez7551', 'New York ❤️', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a5023263-7f65-5cd5-bdd7-658950917e07' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2de89861-67ac-5131-989a-03104c768579' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'mrcrash4724', 'Nyc before mamdani', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2de89861-67ac-5131-989a-03104c768579' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c4b2788b-0366-50cc-af93-277828634229' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'allan29adam43', '30/09/2026 anyone 🇹🇿?', NULL, CAST('2026-09-30T06:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c4b2788b-0366-50cc-af93-277828634229' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ba5ab3ce-fb80-506f-9800-3c1c5e76b1e4' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'noumetheum', 'GG', NULL, CAST('2026-09-30T06:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ba5ab3ce-fb80-506f-9800-3c1c5e76b1e4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('185ee1fb-237f-5858-9855-ff3e9449972e' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'carterfamily2005', '🗣️" NEW YORKKK CONCRETE JUNGLE WET DREAM TOMATO"🔥🔥', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('185ee1fb-237f-5858-9855-ff3e9449972e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2a2e54c5-814f-51c9-aa50-1791fb25fe7c' AS UUID), CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID), NULL, 'azuldavalos8336', 'Solo quiero estar en new York porfavoooor', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2a2e54c5-814f-51c9-aa50-1791fb25fe7c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f4c6bbb4-28cc-5361-a632-e82ac79db0e3' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('5318fa1f-3e27-5c0e-85cd-f7170fbe24c0' AS UUID), 'seed-channel:5318fa1f-3e27-5c0e-85cd-f7170fbe24c0', '5318fa1f-3e27-5c0e-85cd-f7170fbe24c0@catalog.invalid', 'Kanye West', CAST('2011-08-12T00:56:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2011-08-12T00:56:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('5318fa1f-3e27-5c0e-85cd-f7170fbe24c0' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID), 'JAŸ-Z, Kanye West - Otis ft. Otis Redding', 'WATCH THE THRONE: Kanye West & Jay-Z - Otis © 2011 Roc-A-Fella Records, LLC', 30, '/media/2c26735e-210c-5608-a777-2a13b12cae20/thumbnail.webp', '/media/2c26735e-210c-5608-a777-2a13b12cae20/video.mp4', CAST('5318fa1f-3e27-5c0e-85cd-f7170fbe24c0' AS UUID), 271404984, 1434746, CAST('2011-08-12T00:56:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('60a97756-09ba-5c91-b1f7-de88497ca91b' AS UUID), CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID), NULL, 'RobertRunion', 'I kinda feel like these two guys had different messages on this one now.', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('60a97756-09ba-5c91-b1f7-de88497ca91b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9738a86d-dadd-53c8-8631-b6dafd521041' AS UUID), CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID), NULL, 'rodnelljames332', '20006÷<2014', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9738a86d-dadd-53c8-8631-b6dafd521041' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2c26735e-210c-5608-a777-2a13b12cae20' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('28a948fb-821b-57fe-a1d5-be990c0d3629' AS UUID), 'seed-channel:28a948fb-821b-57fe-a1d5-be990c0d3629', '28a948fb-821b-57fe-a1d5-be990c0d3629@catalog.invalid', 'IZAL', CAST('2018-03-12T00:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2018-03-12T00:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('28a948fb-821b-57fe-a1d5-be990c0d3629' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9' AS UUID), 'IZAL - Bill Murray (Lyric Video Oficial)', 'Lyric Video de "Bill Murray" de Izal. 
Escucha el álbum ''Autoterapia'' en: http://smarturl.it/autoterapia

Sigue a Izal en:

Facebook: https://www.facebook.com/izalmusica/
Instagram: https://www.instagram.com/izalmusic/?hl=es
Twitter: https://twitter.com/IZALmusic


http://vevo.ly/rJ1cLv', 30, '/media/4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9/thumbnail.webp', '/media/4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9/video.mp4', CAST('28a948fb-821b-57fe-a1d5-be990c0d3629' AS UUID), 3094381, 7072, CAST('2018-03-12T00:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6f55090a-aebc-5059-8373-2c81c9d9e8ad' AS UUID), CAST('4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9' AS UUID), NULL, 'mpilarcarbonelcasanova7559', 'Leyendo el libro !!!Un cuento Perfecto!!!!bonita música 🎼🎼', NULL, CAST('2026-09-19T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6f55090a-aebc-5059-8373-2c81c9d9e8ad' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('4f2de55b-97c9-5c1d-9d28-4d2eb8535ce9' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('4a8b9b8d-d6cd-53a0-b907-fdff37908a41' AS UUID), 'seed-channel:4a8b9b8d-d6cd-53a0-b907-fdff37908a41', '4a8b9b8d-d6cd-53a0-b907-fdff37908a41@catalog.invalid', 'clarencito', CAST('2018-01-18T11:20:25.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2018-01-18T11:20:25.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('4a8b9b8d-d6cd-53a0-b907-fdff37908a41' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID), 'Scott Pilgrim Vs. The World - Black Sheep [HD]', '🔽if you want to support my channel🔽
[Tips & Video Requests ➜ https://en.tipeee.com/clarencito]
[Scott Pilgrim Vs. The World ➜ https://amzn.to/2SF85N6]
[Scott Pilgrim Soundtrack - Seven Evil Exes Edition (with Brie Larson''s version of Black Sheep) ➜ https://amzn.to/3fetqsi]
[Scott Pilgrim Vs. The World Soundtrack ➜ https://amzn.to/2NBylIj]
[Scott Pilgrim (Complete Collection) ➜ https://amzn.to/31mVEJD]
[Scott Pilgrim "Color Collection" V.1 ➜ https://amzn.to/2YaibYr]
[Amazon Shop ➜ https://www.amazon.com/shop/clarencito]

🔻READ ME🔻
[Instagram ➜ https://www.instagram.com/clarencito.yt]
Scott Pilgrim Vs. The World directed by Edgar Wright 
Music: Black Sheep by @metricmusic with vocals by @Brie Larson (Original Movie Soundtrack)

Lyrics:
Hello again
Friend of a friend, I knew you when
Our common goal was waiting for the world to end
Now that the truth is just a rule that you can bend
You crack the whip, shape-shift and trick the past again

I''ll send you my love on a wire
Lift you up, every time
Everyone, ooh
Pulls away, ooh
From you

Got balls of steel
Got an automobile
For a minimum wage
Got real estate
I''m buying it all up in outer space
Now that the truth is just a rule that you can bend
You crack the whip, shape-shift and trick, the past again

I''ll send you my love on a wire
Lift you up, every time
Everyone, ooh
Pulls a way, ooh
It''s a mechanical bull, the number one
You''ll take a ride from anyone
Everyone wants a ride
Pulls away, ooh from you


#ScottPilgrimVsTheWorld #ScottPilgrim #BrieLarson #EdgarWright #ScottPilgrimIs10 #BlackSheep #Metric

clarencito is a participant in Amazon Associates LLC Program, an affiliate advertising program designed to provide a means for my channel to earn fees by linking to Amazon.com and affiliated sites. 
When you purchase any products through my Amazon page, you''ll be supporting me!', 26, '/media/784cbd60-aa79-5cda-afcf-a81e9c5086b9/thumbnail.webp', '/media/784cbd60-aa79-5cda-afcf-a81e9c5086b9/video.mp4', CAST('4a8b9b8d-d6cd-53a0-b907-fdff37908a41' AS UUID), 86129948, 949738, CAST('2018-01-18T11:20:25.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID), 'FILM_AND_ANIMATION'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID) AND category = 'FILM_AND_ANIMATION') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ef450618-1879-5bf4-8685-5174ebce00eb' AS UUID), CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID), NULL, 'Clarencito', '4K version (with the full song) available here ➜ https://www.youtube.com/watch?v=f-H9bbi0Vyw
If you haven''t seen it yet go check it out and let me know what you think of it ✌️', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3400
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ef450618-1879-5bf4-8685-5174ebce00eb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('14c447ff-e2f9-55ad-954e-5e9196589eb7' AS UUID), CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID), NULL, 'BergOljelund', 'You deserve it :)', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 13
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('14c447ff-e2f9-55ad-954e-5e9196589eb7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bdc05522-724a-5097-a955-574f1868c20c' AS UUID), CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID), NULL, 'chainyfearless2185', 'you''d get a lot more views if you changed the title of the video to Brie Larson Scott Pilgrim Vs. The World - Black Sheep', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bdc05522-724a-5097-a955-574f1868c20c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('511bed14-ebd3-594d-b8fa-b25424ce1aa7' AS UUID), CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID), NULL, 'jessieapperson9663', 'Ohhhhhhhh yeahhhhhhhhhh', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('511bed14-ebd3-594d-b8fa-b25424ce1aa7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('784cbd60-aa79-5cda-afcf-a81e9c5086b9' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('5ff6722a-3b4b-5269-9e50-aa4a7dbada71' AS UUID), 'seed-channel:5ff6722a-3b4b-5269-9e50-aa4a7dbada71', '5ff6722a-3b4b-5269-9e50-aa4a7dbada71@catalog.invalid', 'Kygo', CAST('2017-04-24T17:24:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2017-04-24T17:24:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('5ff6722a-3b4b-5269-9e50-aa4a7dbada71' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), 'Kygo, Selena Gomez - It Ain''t Me (Official Video)', 'My new album ''KYGO'' is out now: https://kygo.lnk.to/kygothealbum

Shop new merch: https://kygo.lnk.to/shop

"It Ain''t Me | Kygo x Selena Gomez | Official music video." 
https://SonyMusic.lnk.to/ItAintMeKygo 

Written and Directed by Phillip R. Lopez 
Executive Produced by Maximilian Guen 
Cinematography by Todd Martin 
Video commissioned by Toby Andrews 

A Magna Carta Production 
Starring Georgia Fowler & Nathan Mitchell  

Performer: Kygo & Selena Gomez 
Guitar: Andrew Watt 
Background Vocal: Andrew Watt / Ali Tamposi / Brian Lee 
Producer: Kygo / Andrew Watt 
Mastered at Sterling Sound in New York, NY Tom Coyne 
Mixed at MixStar Studios, Virginia Beach, VA Serban Ghenea 
Vocal Engineer Louis Bell / Benjamin Rice 
Vocal Producer: Andrew Watt 

(P) 2017 Kygo AS under exclusive license to Sony Music Entertainment International Ltd / Ultra Records, LLC 
Rec Period - 2017 
Repertoire Owner: SME International Limited UK (Kygo) 

https://www.facebook.com/kygoofficial/ 
https://www.instagram.com/kygomusic/', 20, '/media/190fa8fc-8fc5-5d7a-94ba-c2783d4493a0/thumbnail.webp', '/media/190fa8fc-8fc5-5d7a-94ba-c2783d4493a0/video.mp4', CAST('5ff6722a-3b4b-5269-9e50-aa4a7dbada71' AS UUID), 309927836, 2470264, CAST('2017-04-24T17:24:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0f2cbfaf-c4c5-53c2-9798-c6cf215c4234' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'KygoMusic', 'My new album Kygo is available June 21st! Pre-save now: https://kygo.lnk.to/kygothealbum', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3200
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0f2cbfaf-c4c5-53c2-9798-c6cf215c4234' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ef9e29fb-bd0c-5804-91fb-8f32b9638ce3' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'Nat-g5m', 'Meee🎉', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 12
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ef9e29fb-bd0c-5804-91fb-8f32b9638ce3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('66f0a096-1769-57d5-baba-08a18aed61b2' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'silvermoengjr105', 'Crazy you posted this here like you knew we were gonna come back to this song', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 11
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('66f0a096-1769-57d5-baba-08a18aed61b2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('105370c1-8175-5d21-b86c-aaffc7cf9cf2' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'BhimShankar-n6s', 'GOOD MORNING.... HAY. THIS SONG ON ALL STAR''S, WHEN WE SIT ON FIRING. THIS FOR MY MOM AND FRIEND. WE THINK RAM CITY WILL BE NICE. HAY. PATHAN, EYE WON''T TOUCH YOU BEZ YOU HAVE TO ATTEND ALL FUNERAL.... 🔑', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('105370c1-8175-5d21-b86c-aaffc7cf9cf2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('95b93e82-8051-5e89-a1f8-1e89d1e313c8' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'VictoriaKobbah', 'Me ❤❤❤', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('95b93e82-8051-5e89-a1f8-1e89d1e313c8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4f2c6a23-dc21-5222-8ca3-76d7a7e2e14c' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'VIMBAITSIDE-by1fc', '😊😊😊😊😊😊😊', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 26
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4f2c6a23-dc21-5222-8ca3-76d7a7e2e14c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d0ec47b2-d3b4-5a66-8485-ca6058fa0c73' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'manotoneo6848', 'I''m🙋🏿‍♀️ here 😢❤', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d0ec47b2-d3b4-5a66-8485-ca6058fa0c73' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a8b1e39b-875d-5151-b114-bf3eac4f2c71' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'Alejoqg', 'It’s gonna be jmmm 🩶', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a8b1e39b-875d-5151-b114-bf3eac4f2c71' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4654fac0-5ed7-55a7-81b4-44d085d9bfed' AS UUID), CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID), NULL, 'JNVJORHAT-m2h', 'Cccc cc 🤮', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4654fac0-5ed7-55a7-81b4-44d085d9bfed' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('190fa8fc-8fc5-5d7a-94ba-c2783d4493a0' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('56cda952-5176-5384-a510-e8cc92c98d76' AS UUID), 'Game of Reggaethrones', 'La versión Reggaetón de Juego de Tronos.

Voz y letra de @Trazzto

Síguenos en twitter y vine: @Trazzto @minibigstudio

Más vídeos en TV.MINIBIG.ES

Game of Reggaethrones (Letra)

Apaga la luz y pon Canal plus
que empieza Game of Thrones.
Apaga la luz y pon Canal plus
que empieza Game of Thrones.
(Bis)

¡Hodor!
Vamos mi gente que en Poniente la cosa está mal.
¡Hodor!
Vamos mi gente que esto está más muerto que un Stark.
¡Hodor!
Pero luchando en el muro no me econtrarás.
¡Hodor
Los de la Guardia de la noche no pueden pillar.
¡Hodor!

A ella le gusta el fuego Valyrio.
Dame más fuego Valyrio
A ella le gusta el fuego Valyrio.
Dame más fuego Valyrio
(Bis)

Ella tiene tres dragones.
Te descompone.
Dice “Dracaris” y ellos te fríen los cojones.
Hasta a Khal drogo se le caían los calzones.
Por eso el pobre Jorah no sale de la “friendzone”.

Aquí hay espadas, no son los Lunnis.
Ten bien presente que todos “Valar Morghulis”
Vigila siempre por tu cabeza.
“Cuidao” que Joffrey tiene a mano la ballesta.

Viene aquí toda la gente. 
Con la muerte escrita en la frente.
Cualquiera puede ser el blanco
y a la mínima te dejan manco.  

¡Hodor!
Vamos mi gente que en Poniente la cosa está mal.
¡Hodor!
Vamos mi gente que esto está más muerto que un Stark.
¡Hodor!
Pero luchando en el muro no me econtrarás.
¡Hodor
Los de la Guardia de la noche no pueden pillar.
¡Hodor!

A ella le gusta el fuego Valyrio.
Dame más fuego Valyrio
A ella le gusta el fuego Valyrio.
Dame más fuego Valyrio
(Bis)', 24, '/media/56cda952-5176-5384-a510-e8cc92c98d76/thumbnail.webp', '/media/56cda952-5176-5384-a510-e8cc92c98d76/video.mp4', CAST('4ac1493b-3661-5f2e-b083-42b3cdf6d35a' AS UUID), 881514, 12144, CAST('2015-01-28T19:48:48.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('56cda952-5176-5384-a510-e8cc92c98d76' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('56cda952-5176-5384-a510-e8cc92c98d76' AS UUID), 'FILM_AND_ANIMATION'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('56cda952-5176-5384-a510-e8cc92c98d76' AS UUID) AND category = 'FILM_AND_ANIMATION') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('56cda952-5176-5384-a510-e8cc92c98d76' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('819bd67b-ffc4-5eae-b945-18ebd1154a4f' AS UUID), CAST('56cda952-5176-5384-a510-e8cc92c98d76' AS UUID), NULL, 'caprand8984', '2026 y sigo escuchandolas y riendome como la primera vez', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('819bd67b-ffc4-5eae-b945-18ebd1154a4f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('56cda952-5176-5384-a510-e8cc92c98d76' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('7e6c088b-a798-58c6-848b-e3a69bc26610' AS UUID), 'seed-channel:7e6c088b-a798-58c6-848b-e3a69bc26610', '7e6c088b-a798-58c6-848b-e3a69bc26610@catalog.invalid', 'Bruno Mars', CAST('2011-04-15T22:08:07.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2011-04-15T22:08:07.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('7e6c088b-a798-58c6-848b-e3a69bc26610' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('64801bdb-7ecd-516e-a8b2-c130e9063d8b' AS UUID), 'Bruno Mars - The Lazy Song (Official Music Video)', 'The official music video for Bruno Mars'' "The Lazy Song" from the album ''Doo-Wops and Hooligans''''.
Stream: https://apple.co/38qBTEU

Directed by Bruno Mars and Cameron Duddy

Choreographed and Performed by Poreotics: http://poreotics.com

Comic Chimp Mask used by permission of Easter Unlimited, Inc. / FunWorld Div. All Rights Reserved. Copyright 2009.

The Romantic – the new album from Bruno Mars, available now. Listen now: https://brunomars.lnk.to/theromantic

Stream or Download Doo-Wops & Hooligans: https://brunomars.lnk.to/DooWopsAndHooligans

Join Bruno’s mailing list: https://drop.cobrand.com/d/BrunoMars/Subscribe

Shop Bruno’s official store: https://brunomars.lnk.to/officialstore

Connect with Bruno: 
https://www.tiktok.com/@brunomars
https://www.instagram.com/brunomars
https://www.youtube.com/brunomars
https://x.com/brunomars
https://www.facebook.com/brunomars

https://brunomars.com

Bruno Mars is a 16x GRAMMY®-winning global superstar, singer, songwriter, multi-instrumentalist, producer, and one of the most-streamed artists in the world. Known for his showmanship and chart-toppers, Bruno has set a number of records throughout his career, including becoming the first artist ever to hit 150 million monthly listeners on Spotify, appearing on two of the fastest songs to reach one billion streams (for “Die with a Smile” with Lady Gaga and “APT.” with ROSÉ, and achieving the highest-certified song in RIAA history with 2010’s “Just the Way You Are”). Since launching a string of hits beginning in 2009, Bruno has sold over 150 million records worldwide, making him one of the best-selling artists of all time. Beyond his work as a soloist, Bruno is a member of the duo Silk Sonic with Anderson .Paak. In addition to his 35 Billboard Hot 100 hits, including nine number one singles, Bruno is the recipient of 16 GRAMMY® Awards (including “Album of the Year” for 24K Magic), 14 American Music Awards, and seven MTV Video Music Awards. His 24K Magic World Tour was among the highest-grossing tours in history, and within the top ten highest-grossing of the 2010s.

LYRICS
Today I don''t feel like doing anything
I just wanna lay in my bed
Don''t feel like picking up my phone
So leave a message at the tone
''Cause today I swear I''m not doing anything.

Uh!
I''m gonna kick my feet up
Then stare at the fan
Turn the TV on, throw my hand in my pants
Nobody''s gonna tell me I can''t

I''ll be lounging on the couch,
Just chillin'' in my snuggie
Click to MTV, so they can teach me how to dougie
''Cause in my castle I''m the freaking man

Oh, yes I said it
I said it
I said it ''cause I can

Today I don''t feel like doing anything
I just wanna lay in my bed
Don''t feel like picking up my phone
So leave a message at the tone
''Cause today I swear I''m not doing anything

Nothing at all!
Ooh, hoo, ooh, hoo, ooh, ooh-ooh
Nothing at all
Ooh, hoo, ooh, hoo, ooh, ooh-ooh

Tomorrow I''ll wake up, do some P90X
Meet a really nice girl, have some really nice sex
And she''s gonna scream out: ''This is Great'' (Oh my God, this is great)
Yeah

I might mess around, get my college degree
I bet my old man will be so proud of me
But sorry pops, you''ll just have to wait
Haha

Oh, yes I said it
I said it
I said it ''cause I can

Today I don''t feel like doing anything
I just wanna lay in my bed
Don''t feel like picking up my phone
So leave a message at the tone
''Cause today I swear I''m not doing anything

No, I ain''t gonna comb my hair
''Cause I ain''t going anywhere
No, no, no, no, no, no, no, no, no
I''ll just strut in my birthday suit
And let everything hang loose
Yeah, yeah, yeah, yeah, yeah, yeah, yeah, yeah, yeah, yeah

Ooh
Today I don''t feel like doing anything
I just wanna lay in my bed
Don''t feel like picking up my phone
So leave a message at the tone
''Cause today I swear I''m not doing anything

Nothing at all
Nothing at all
Nothing at all


#BrunoMars #TheLazySong #DooWopsandHooligans #OfficialMusicVideo #AtlanticRecords', 22, '/media/64801bdb-7ecd-516e-a8b2-c130e9063d8b/thumbnail.webp', '/media/64801bdb-7ecd-516e-a8b2-c130e9063d8b/video.mp4', CAST('7e6c088b-a798-58c6-848b-e3a69bc26610' AS UUID), 3304865362, 16798159, CAST('2011-04-15T22:08:07.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('64801bdb-7ecd-516e-a8b2-c130e9063d8b' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('64801bdb-7ecd-516e-a8b2-c130e9063d8b' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('64801bdb-7ecd-516e-a8b2-c130e9063d8b' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('64801bdb-7ecd-516e-a8b2-c130e9063d8b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('20d9554f-1a7b-5ee6-9369-c1adc4ac17e6' AS UUID), CAST('64801bdb-7ecd-516e-a8b2-c130e9063d8b' AS UUID), NULL, 'TravisMartinez-s3t', '2026, and this era of music was my childhood and I miss it deeply 😓 almost 21 now and was listening to this when I was 7-10 or earlier, it''s bittersweet bitter because this era of music will never happen again, but sweet because I''m glad this era of music still gets love from the OGs', NULL, CAST('2026-09-30T06:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('20d9554f-1a7b-5ee6-9369-c1adc4ac17e6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('64801bdb-7ecd-516e-a8b2-c130e9063d8b' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), 'Taylor Swift - You Need To Calm Down', 'Music video by Taylor Swift performing “You Need To Calm Down”.

Support the Equality Act: https://taylorswift.lnk.to/petition


►Download “You Need To Calm Down" here: https://TaylorSwift.lnk.to/YNTCDsu
►Pre-Order ‘Lover’ here: https://TaylorSwift.lnk.to/Loversu

►Exclusive Merch: https://store.taylorswift.com

►Follow Taylor Swift Online
Instagram: http://www.instagram.com/taylorswift
Facebook: http://www.facebook.com/taylorswift
Tumblr: http://taylorswift.tumblr.com
Twitter: http://www.twitter.com/taylorswift13
Website: http://www.taylorswift.com

►Follow Taylor Nation Online
Instagram: http://www.instagram.com/taylornation
Tumblr: http://taylornation.tumblr.com
Twitter: http://www.twitter.com/taylornation13

Featuring appearances by (in alphabetical order):
A''keria Davenport
Adam Lambert
Adam Rippon
Adore Delano
Antoni Porowski
Billy Porter
Bobby Berk
Chester Lockhart
Ciara
Delta Work
Dexter Mayfield
Ellen Degeneres
Hannah Hart
Hayley Kiyoko
Jade Jolie
Jesse Tyler Ferguson
Jonathan Van Ness
Justin Mikita
Karamo Brown
Katy Perry
Laverne Cox
Riley Knoxx
Rupaul
Ryan Reynolds
Tan France
Tatianna
Todrick Hall
Trinity K Bonet
Trinity Taylor

Director: Drew Kirsch & Taylor Swift
Executive Producers: Todrick Hall & Taylor Swift 
Producers: Tara Razavi & Fuliane Petikyan for Happy Place, Inc.

© 2019 Taylor Swift

#TaylorSwift #YouNeedToCalmDown #TaylorSwiftLover', 25, '/media/c8b03b70-124c-5913-ad39-705b9d550cb1/thumbnail.webp', '/media/c8b03b70-124c-5913-ad39-705b9d550cb1/video.mp4', CAST('194ee690-0136-5a6f-9a26-94baa21c0b80' AS UUID), 392716094, 4823645, CAST('2019-06-17T12:13:12.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a4cc03d5-d151-50e2-9069-29678447c242' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'LJFaeldin-xoxo', 'Yeah I love her!❤', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a4cc03d5-d151-50e2-9069-29678447c242' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('618f3bf0-7a67-5311-9dcb-c408346c15f2' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'josephhicks6989', 'The best video and song I have heard in a long time.', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('618f3bf0-7a67-5311-9dcb-c408346c15f2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fdcebf5d-8100-5fe0-bc29-60fc25420c3f' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'Yellowflowers-w5t', 'It’s 7am calm down dam ❤', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fdcebf5d-8100-5fe0-bc29-60fc25420c3f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f42e7e75-98af-5f39-ac8e-baa8a0006745' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'billkormas3460', 'and I''m just like DAYM 💜 it''s seven ay-EHM 💜', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f42e7e75-98af-5f39-ac8e-baa8a0006745' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ffbe5ebb-1f02-5395-8fb2-fdaf91c7e26b' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'krishnagurunathbhandi4853', '🇩🇿😅', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ffbe5ebb-1f02-5395-8fb2-fdaf91c7e26b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1152f803-92b1-58ff-975c-e5209b33feff' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'WayneStewart-x7l', 'Hey Algeria how’s your Paris Olympic trans boxer doing? Didn’t think you guys were into that.Oh well takes all sorts I guess.', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1152f803-92b1-58ff-975c-e5209b33feff' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f70d3ae4-284f-52ae-af24-a776b54ceccb' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'RipleyBell', '0:13 reaffirming when Donald text her some stupidity stuff', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f70d3ae4-284f-52ae-af24-a776b54ceccb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('549de515-bfd5-5c52-b1b2-4527a1c37f71' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'RipleyBell', '0:53 uh oh uh oh to you need to calm down', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('549de515-bfd5-5c52-b1b2-4527a1c37f71' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f9979fc7-cf3b-58db-8e31-52be36f6525c' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'user-vi6ks4pl4o', 'Those cakes in this vedio looks so yummy,y mot gives us some more', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f9979fc7-cf3b-58db-8e31-52be36f6525c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('27e96dd9-56f2-50d2-a414-303f303ea9e3' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'nikiahu4740', 'Wow in 2026 Ellen & Ryan are hated & Katy is mocked for being a fake astronaut 😝😝😝', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('27e96dd9-56f2-50d2-a414-303f303ea9e3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5de96836-4f0e-55a9-a5f0-3e75c3037543' AS UUID), CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID), NULL, 'WayneStewart-x7l', 'Did you see the shape of the rocket they ‘went to space’in?
Vile perverts.', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5de96836-4f0e-55a9-a5f0-3e75c3037543' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('c8b03b70-124c-5913-ad39-705b9d550cb1' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('8cb640dd-5438-5cf9-b6df-6a5a33d4f856' AS UUID), 'seed-channel:8cb640dd-5438-5cf9-b6df-6a5a33d4f856', '8cb640dd-5438-5cf9-b6df-6a5a33d4f856@catalog.invalid', 'Songkick', CAST('2012-05-30T00:48:38.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2012-05-30T00:48:38.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('8cb640dd-5438-5cf9-b6df-6a5a33d4f856' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), 'Ed Sheeran - You Need Me, I Don''t Need You | LIVE', 'Ed Sheeran performs his song "You Need Me, I Don''t Need You" in an exclusive recording session live at Hinge Studios in Chicago, IL for The Live Room.

#edsheeran #youneedmeidontneedyou

Watch more of Ed Sheeran in The Live Room:
http://goo.gl/hTwWN

Executive Producer
Phil Botti

Director
Michael Thelin

Mixed by
Brett Eliason

Recording Engineer
Craig Bauer

Editor
Steven Pierce

Captured live at Hinge Studios
Chicago, IL

Watch more Ed Sheeran videos on The Warner Sound:
http://goo.gl/Cvfkk

Order Ed''s album "+": http://atlr.ec/IVN3gX

Stay updated with Ed’s newest music:
Listen to Ed’s newest album, “=”: https://es.lnk.to/equals
Watch Ed’s new video for “The Joker and the Queen” with Taylor Swift:  https://youtu.be/2qzcHLyv3N0 #TheJokerandTheQueen

Follow: http://twitter.com/EdSheeran
Like: http://facebook.com/EdSheeranMusic
Visit: http://edsheeran.com

Download the free "One Take EP": http://atlr.ec/K0pSVI

The Live Room with Ed Sheeran was captured exclusively with Nikon D4 HD-SLRs camera and NIKKOR lenses.

The Live Room is an exclusive  original series that captures today''s most innovative artists performing live recording sessions in the most iconic recording studios across America.', 24, '/media/1c6aa19b-9210-5f14-8121-348c4658cd75/thumbnail.webp', '/media/1c6aa19b-9210-5f14-8121-348c4658cd75/video.mp4', CAST('8cb640dd-5438-5cf9-b6df-6a5a33d4f856' AS UUID), 33333616, 269275, CAST('2012-05-30T00:48:38.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2fc3d2b4-56a5-50d5-a2b3-845a0a1c3042' AS UUID), CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), NULL, 'songkick', 'Who else is loving Ed''s ''Afterglow'' song?? https://EdSheeran.lnk.to/Afterglow', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 982
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2fc3d2b4-56a5-50d5-a2b3-845a0a1c3042' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fac7b309-78db-51db-a972-3097ae03e766' AS UUID), CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), NULL, 'sharonplatipodis4532', 'How could you not love it?', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 7
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fac7b309-78db-51db-a972-3097ae03e766' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('db230127-1158-5ac1-8452-21b7cfc26a58' AS UUID), CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), NULL, 'sara-antoniabogdan939', 'Meee!!!', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('db230127-1158-5ac1-8452-21b7cfc26a58' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('904f0dea-b486-5f27-89c8-9cbbbcde87f3' AS UUID), CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), NULL, 'cval7003', 'Good on ya mate 🤙', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('904f0dea-b486-5f27-89c8-9cbbbcde87f3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('da736d30-ea55-5796-9452-ef4092e641b5' AS UUID), CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), NULL, 'NvardHarutyunyan', 'ME!', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('da736d30-ea55-5796-9452-ef4092e641b5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('399a4f9c-f40c-56d0-acce-c88c2af09ff0' AS UUID), CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), NULL, 'dawnaaldrich8987', 'Omg! The best of the best. He can conquer any genre. My favorite rapper is my Ginger genius, also known as…..Ed Sheeran! ❤❤❤❤', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('399a4f9c-f40c-56d0-acce-c88c2af09ff0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d843f485-fa6a-5272-a676-01e0e4251b9a' AS UUID), CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID), NULL, 'cherryred9125', 'meeeee!!!!', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d843f485-fa6a-5272-a676-01e0e4251b9a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1c6aa19b-9210-5f14-8121-348c4658cd75' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('201cfdfb-4cde-5ccc-9967-470623d292d3' AS UUID), 'seed-channel:201cfdfb-4cde-5ccc-9967-470623d292d3', '201cfdfb-4cde-5ccc-9967-470623d292d3@catalog.invalid', 'The Weeknd', CAST('2020-12-04T05:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2020-12-04T05:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('201cfdfb-4cde-5ccc-9967-470623d292d3' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID), 'The Weeknd ft. ROSALÍA - Blinding Lights [Remix] (Official Lyric Video)', 'Official lyric video for The Weeknd “Blinding Lights” Rosalia Remix, available everywhere now: https://TheWeeknd.lnk.to/BLRosaliaRemix', 26, '/media/bdd53c4f-166f-5f45-b086-bcd7ca2d2e40/thumbnail.webp', '/media/bdd53c4f-166f-5f45-b086-bcd7ca2d2e40/video.mp4', CAST('201cfdfb-4cde-5ccc-9967-470623d292d3' AS UUID), 51776725, 842270, CAST('2020-12-04T05:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('302d3add-beaf-5705-87fd-7d15484c5a86' AS UUID), CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID), NULL, 'cooluke29', 'shes speaking rich', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('302d3add-beaf-5705-87fd-7d15484c5a86' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ce7ca856-1f07-5031-9aa1-28465d327b5b' AS UUID), CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID), NULL, 'DidierDjomo-e9f8q', 'TOP CHART RIGHT NOW.', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ce7ca856-1f07-5031-9aa1-28465d327b5b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('348a52d5-9d85-583b-a535-a367e5430dd5' AS UUID), CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID), NULL, 'DidierDjomo-e9f8q', 'NUMBER 6.', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('348a52d5-9d85-583b-a535-a367e5430dd5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6a5118d2-6c39-53ab-84b8-cb4372a585b6' AS UUID), CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID), NULL, 'talgotren12', 'The Weeknd: seguro que entiendo a Rosalía
Rosalía: venga, abre la luz que no puedo dormir', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6a5118d2-6c39-53ab-84b8-cb4372a585b6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a638c849-b263-528e-afaf-80c9421d8db6' AS UUID), CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID), NULL, 'adaljarquin484', 'Simplemente horroroso', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a638c849-b263-528e-afaf-80c9421d8db6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('bdd53c4f-166f-5f45-b086-bcd7ca2d2e40' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('3c7fbf02-ae41-5c83-aaab-22fdad753c62' AS UUID), 'seed-channel:3c7fbf02-ae41-5c83-aaab-22fdad753c62', '3c7fbf02-ae41-5c83-aaab-22fdad753c62@catalog.invalid', 'The Chainsmokers', CAST('2016-07-29T07:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2016-07-29T07:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('3c7fbf02-ae41-5c83-aaab-22fdad753c62' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), 'The Chainsmokers - Closer (Lyric) ft. Halsey', 'Official Lyric Video for "Closer" by The Chainsmokers
Listen to The Chainsmokers: https://thechainsmokers.lnk.to/listenYD 
Watch more videos by The Chainsmokers: https://thechainsmokers.lnk.to/listenYD/youtube 

Subscribe to the official Chainsmokers YouTube channel: https://thechainsmokers.lnk.to/subscribeYD 

Follow The Chainsmokers
Facebook: https://thechainsmokers.lnk.to/followFI 
Instagram: https://thechainsmokers.lnk.to/followII 
Twitter: https://thechainsmokers.lnk.to/followTI 
Website: https://thechainsmokers.lnk.to/followWI 
Spotify: https://thechainsmokers.lnk.to/followSI 
YouTube: https://thechainsmokers.lnk.to/subscribeYD 

Chorus:
So, baby, pull me closer
In the backseat of your Rover
That I know you can''t afford
Bite that tattoo on your shoulder
Pull the sheets right off the corner
Of the mattress that you stole
From your roommate back in Boulder
We ain''t ever getting older

#Closer #TheChainsmokers #Halsey #EDM', 21, '/media/2e32e6f7-fe4b-5822-967b-d733f0e24a42/thumbnail.webp', '/media/2e32e6f7-fe4b-5822-967b-d733f0e24a42/video.mp4', CAST('3c7fbf02-ae41-5c83-aaab-22fdad753c62' AS UUID), 3464848340, 15085200, CAST('2016-07-29T07:00:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4ed3de46-b342-5101-b16d-ef761deacfa9' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'phucduong394', 'old but gold👏', NULL, CAST('2026-09-30T10:59:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4ed3de46-b342-5101-b16d-ef761deacfa9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d4c768d0-c5b8-530e-95a4-b502517a7a35' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'Ben-o4e4w', '“We ain’t ever getting older” 10 years ago', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d4c768d0-c5b8-530e-95a4-b502517a7a35' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d86effd6-6fd9-5de3-bed0-1e5881cd3a6f' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'theorange2735', '10 years from 18 to 28 😢', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d86effd6-6fd9-5de3-bed0-1e5881cd3a6f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('26943e3b-db9d-5a14-b130-e631e2083755' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'libinjohn777', '10 years❤️', NULL, CAST('2026-09-30T06:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('26943e3b-db9d-5a14-b130-e631e2083755' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('69d915ff-ce1f-5327-b70e-6cc2761b0369' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'ItzToca_Aurora', 'Plaid shirts and distressed denim shorts', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('69d915ff-ce1f-5327-b70e-6cc2761b0369' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('848d4390-e7d4-5820-a494-494aded3e64f' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'NishaliMahavithanage', 'හරි, තව පහදිලිව line by line කියන්නම් Closer එක ❤️

1. "Hey, I was doing just fine before I met you"
= ඔයාව ආයෙ දැක්කට කලින් මම හොඳින් හිටියා. ඔයාව දැකලා ආයෙ හැමදේම අවුල් වුණා.

2. "I drink too much and that''s an issue, but I''m okay"
= මම තාම පරණ විදියමයි, බොනවා, ටිකක් අවුල් වෙලා ඉන්නේ. හැබැයි මම okay.

3. "You look as good as the day I met you, I forget just why I left you"
= මේක තමයි key line එක. ඔයාව දැක්කම ඔයා එදා වගේම ලස්සනයි. මම ඇයි ඔයාව දාලා ගියේ කියලත් මට අමතක වුණා.

4. "I was in your Rover, you know I can''t afford a mattress that don''t have a tattoo?"
= මේකෙන් කියන්නේ දෙන්නාගේ පරණ intimate memory එකක්. Rover එක කියන්නේ car එක. Mattress එකේ tattoo එක කියන්නේ ඔවුන් දෙන්නා එකට හිටපු කාලේ sex කරපු මතකයක් වගේ දෙයක්. ඒක තාම එයාට මතකයි.

5. "So baby pull me closer in the backseat of your Rover"
= මේකෙන් කියන්නේ දෙන්නා ආයෙ car එක ඇතුළේ ළං වෙනවා. ඒක physical.

6. "We ain''t ever getting older"
= මේකේ ගැඹුරුම තේරුම. අපි දෙන්නා දන්නවා හෙට උදේ වෙද්දි මේක ඉවරයි, අපි ආයෙ වෙන් වෙනවා කියලා. ඒ නිසා අද රෑ අපි වයසට යන්නේ නෑ වගේ ඉමු, හෙට ගැන හිතන්නේ නැතුව. ඒ කියන්නේ moment එකේ live වෙනවා.

ඇත්තටම වෙන්නේ මොකක්ද?

කොල්ලා ගමට ඇවිත්, ex ව ආයෙ දැකලා. දෙන්නා hotel එකකට ගිහින්. දෙන්නම දන්නවා මේක temporary, වැරදි කියලා. හැබැයි දෙන්නටම තනිකමයි, පරණ feeling එක ඕන වෙලා. ඒ නිසා එක රෑකට ආයෙ ex ලා වගේ නෙවෙයි, පරණ lovers ලා වගේ ඉන්නවා.

ඒකයි ගොඩක් අයට මේ song එක දැනෙන්නේ. මොකද ගොඩක් අයට ex කෙනෙක් ආයෙ හම්බවෙලා, "ආයෙ පටන් ගමුද?" කියලා හිතුණ feeling එක ඇවිත් තියෙනවා නේ.

ඔයාට මේකේ තියෙන්නේ sad ending එකක් ද, happy ending එකක් ද කියලා හිතෙන්නේ?', NULL, CAST('2026-09-29T19:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('848d4390-e7d4-5820-a494-494aded3e64f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f8583b4f-17a8-5905-a275-49d410e168b3' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'laketofino42', 'But Halsey is getting older. She''s over 30', NULL, CAST('2026-09-29T17:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f8583b4f-17a8-5905-a275-49d410e168b3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0e148e7a-1bbf-5881-84c7-871476de298b' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'Splashhh215', 'Day 1️⃣ of listening to ‘Closer’ x Chainsmokers everyday for 10 years 🩵', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0e148e7a-1bbf-5881-84c7-871476de298b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d37bf641-db28-5cfa-95de-eeccfd0978d5' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'johnrony7962', 'Guys, if you like this song, Nine Inch Nails made a great cover, do check it out!', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d37bf641-db28-5cfa-95de-eeccfd0978d5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('079baaa7-a6b1-500a-ba53-147491036a96' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'jonijj2445', 'Yo', NULL, CAST('2026-09-29T15:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('079baaa7-a6b1-500a-ba53-147491036a96' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4d33e462-e115-593b-9259-7afc396f4f1a' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'LekSuroso-m9n', 'Halo semua 🇮🇩🇮🇩', NULL, CAST('2026-09-29T13:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4d33e462-e115-593b-9259-7afc396f4f1a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2265516f-a7a5-5ce9-be74-e7969c1393cb' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'FriendZoneStudio-j6i', '🎉🎉', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2265516f-a7a5-5ce9-be74-e7969c1393cb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('94ab8468-ea8a-59c7-a367-cf605f231ee7' AS UUID), CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID), NULL, 'ReniceJoJayceSlobigayfohfo337h', 'Ijou', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('94ab8468-ea8a-59c7-a367-cf605f231ee7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('2e32e6f7-fe4b-5822-967b-d733f0e24a42' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('ada3159a-2ed3-52fd-b5cb-f5fc13d6ccc4' AS UUID), 'seed-channel:ada3159a-2ed3-52fd-b5cb-f5fc13d6ccc4', 'ada3159a-2ed3-52fd-b5cb-f5fc13d6ccc4@catalog.invalid', 'Justin Bieber', CAST('2020-02-12T20:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2020-02-12T20:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('ada3159a-2ed3-52fd-b5cb-f5fc13d6ccc4' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), 'Justin Bieber - Intentions (Official Video (Short Version)) ft. Quavo', 'Changes: https://justinbieber.lnk.to/Changes

Watch Official Video:
https://justinbieber.lnk.to/IntentionsVideo

Join Justin Bieber in supporting Alexandria House''s mission to help women and children move from crisis to stability by donating to the INTENTIONS Fund here: https://www.alexandriahouse.org/inten...

Follow Justin:
http://facebook.com/justinbieber
http://twitter.com/justinbieber
http://instagram.com/justinbieber

Sign up for Justin’s newsletter: http://justinbiebermusic.com

Directed by: Michael D. Ratner

Production company: OBB Pictures
Executive Producers: Michael D. Ratner, Scott Ratner, Miranda Sherman, Kfir Goldberg and Andy Mininger


Music video by Justin Bieber performing Intentions (Official Video (Short Version)). © 2020 Def Jam Recordings, a division of UMG Recordings, Inc.

http://vevo.ly/DHc2fp', 27, '/media/e8085ecd-0456-595c-b9a6-1df0dd878e97/thumbnail.webp', '/media/e8085ecd-0456-595c-b9a6-1df0dd878e97/video.mp4', CAST('ada3159a-2ed3-52fd-b5cb-f5fc13d6ccc4' AS UUID), 976520135, 4830807, CAST('2020-02-12T20:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8d5ea9fa-cb0e-570a-8b4d-1316338b8eaf' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'Rachelodour', 'Rachel CHWETY 😂😂😂❤!!', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8d5ea9fa-cb0e-570a-8b4d-1316338b8eaf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('de9b4823-2b3b-56ea-9967-654d82c23aa7' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'Rachelodour', 'The heart what it wants ❤❤-Selena -pretty little liars fan!!', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('de9b4823-2b3b-56ea-9967-654d82c23aa7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b3d6be96-5310-5ab0-a428-ab1963209405' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'GalaxyBagenda-v5z', 'Perfect 😂😂😂', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b3d6be96-5310-5ab0-a428-ab1963209405' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('22de4cfb-9517-5188-bc62-646c44269d5f' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'immaculatefix2985', 'Amen 🙏', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('22de4cfb-9517-5188-bc62-646c44269d5f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('53de5976-b1f6-57c6-a7bd-2e1dd7cd006e' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'fernandoalex4092', 'The Best music JUSTIN😅', NULL, CAST('2026-09-29T23:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('53de5976-b1f6-57c6-a7bd-2e1dd7cd006e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8b843215-d6f4-569f-9cb8-ef81e7a905b0' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'fernandoalex4092', '😅❤i lke that', NULL, CAST('2026-09-29T22:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8b843215-d6f4-569f-9cb8-ef81e7a905b0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('53c00402-1ae9-5740-aa69-210a0e417b6f' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'mwanamaria5349', 'We need to give you the attention you deserve. Xyz please sign him and take this talent to another level', NULL, CAST('2026-09-29T21:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('53c00402-1ae9-5740-aa69-210a0e417b6f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a0614167-88e2-544c-a02f-85e16b7d2b9f' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'АнтонияАлександрова16', 'Евала продължавай все така аз съм Антония твоя фенка 🎉', NULL, CAST('2026-09-29T18:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a0614167-88e2-544c-a02f-85e16b7d2b9f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1845ec88-9dd8-556d-ac3e-890d0bc3cd73' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'mizzo-b7928', 'Yarinziza nuko mwese atandero mugira mubizanamwo na bif', NULL, CAST('2026-09-29T17:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1845ec88-9dd8-556d-ac3e-890d0bc3cd73' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('86b47e48-87b6-5425-b4db-47235baa6e1c' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'ShannonMalayajones', '6 more minutes until completed', NULL, CAST('2026-09-29T14:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('86b47e48-87b6-5425-b4db-47235baa6e1c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f52b4d22-b7cf-5a0c-be5b-91eed6cc70cb' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'hboymaxaa6144', 'September 2026', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f52b4d22-b7cf-5a0c-be5b-91eed6cc70cb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('665755bc-2f23-54f6-a3ba-8108c8f711ef' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'yvonnedouver2441', 'This would be a helluva soundtrack for a movie...stay tune🎉', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('665755bc-2f23-54f6-a3ba-8108c8f711ef' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a9853c7e-af04-5c2f-be93-e31ca7fdbc01' AS UUID), CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID), NULL, 'romina6907', '❤❤❤ 🎉🎉🎉 😊', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a9853c7e-af04-5c2f-be93-e31ca7fdbc01' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e8085ecd-0456-595c-b9a6-1df0dd878e97' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('93a160eb-cc52-5158-9bad-76380286d529' AS UUID), 'seed-channel:93a160eb-cc52-5158-9bad-76380286d529', '93a160eb-cc52-5158-9bad-76380286d529@catalog.invalid', 'Proximity', CAST('2016-08-05T15:30:10.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2016-08-05T15:30:10.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('93a160eb-cc52-5158-9bad-76380286d529' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID), 'DJ Snake ft. Justin Bieber - Let Me Love You [Official Lyric Video]', 'Listen to Proximity Radio: https://radio.prxmusic.com/ Sign up for music discovery and deep conversations at the intersection of electronic music, culture, and creativity.
•DJ Snake ft. Justin Bieber - Let Me Love You [Official Lyric Video]•
SPOTIFY! - https://sptfy.com/proximity

A song that I have been excited for, for a LONG time. I have the pleasure of providing the official lyric video for DJ Snake & Justin Bieber''s track "Let Me Love You". Personally I don''t know if I like Cold Water or Let Me Love You more but they are both incredible. Hope you enjoy. :)

Stream "Encore" on Spotify: http://smarturl.it/EncoreDJSnake.sp

•DJ Snake:
https://soundcloud.com/djsnake
http://www.facebook.com/djsnake.fr
http://www.twitter.com/djsnake

•Justin Bieber:
https://www.instagram.com/justinbieber/
https://twitter.com/justinbieber
http://www.justinbiebermusic.com/

Lyric video by: http://Incept.online

Demo Submit: http://demo.prxmusic.com', 27, '/media/fa7abe29-dcf8-58b1-bff9-27b1405f9e07/thumbnail.webp', '/media/fa7abe29-dcf8-58b1-bff9-27b1405f9e07/video.mp4', CAST('93a160eb-cc52-5158-9bad-76380286d529' AS UUID), 1255683261, 7005489, CAST('2016-08-05T15:30:10.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID), 'ENTERTAINMENT'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID) AND category = 'ENTERTAINMENT') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2b03bdc3-746a-5dac-b807-d0c1fbd73783' AS UUID), CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID), NULL, 'Proximity', '1 BILLION VIEWS! Subscribe for more music and follow our playlist on Spotify! :)
 http://spoti.fi/Proximity', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 20000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2b03bdc3-746a-5dac-b807-d0c1fbd73783' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5cf3d586-76b2-53c5-b4f5-5c31f8cdc254' AS UUID), CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID), NULL, 'TheTreytonGamer', 'CONGO', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 9
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5cf3d586-76b2-53c5-b4f5-5c31f8cdc254' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('56afcac6-8096-5dc8-a584-d97640dad11e' AS UUID), CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID), NULL, 'vibe-and-thriv3', 'Omg am so addicted I heard it so many times that even my mum is fed up of it', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 9
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('56afcac6-8096-5dc8-a584-d97640dad11e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fa7abe29-dcf8-58b1-bff9-27b1405f9e07' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('941c1119-fc9d-5c6e-9ffb-c595e9bc031d' AS UUID), 'seed-channel:941c1119-fc9d-5c6e-9ffb-c595e9bc031d', '941c1119-fc9d-5c6e-9ffb-c595e9bc031d@catalog.invalid', 'Clean Bandit', CAST('2017-03-17T10:02:57.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2017-03-17T10:02:57.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('941c1119-fc9d-5c6e-9ffb-c595e9bc031d' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('1b9b851b-a27f-55a3-98db-5354a9786728' AS UUID), 'Clean Bandit - Symphony (feat. Zara Larsson) [Official Video]', 'Listen to our new song Believe with Lloyiso https://cleanbandit.ffm.to/believe

Creative Director - Grace
Director - Jack
Drone cinematography - Luke
Cinematography - Anya & Dasha 

Download or stream our new album "What Is Love?" - out now: http://atlanti.cr/WhatIsLove

Click here to subscribe: http://bit.ly/SubscribeToCleanBandit

Follow us:
Website: http://cleanbandit.co.uk/
Facebook: http://www.facebook.com/cleanbandit 
Twitter: http://www.twitter.com/cleanbandit 
Instagram: http://instagram.com/cleanbandit
Soundcloud: http://www.soundcloud.com/cleanbandit
Spotify: http://www.atlre.co.uk/CleanBanditSpo...', 22, '/media/1b9b851b-a27f-55a3-98db-5354a9786728/thumbnail.webp', '/media/1b9b851b-a27f-55a3-98db-5354a9786728/video.mp4', CAST('941c1119-fc9d-5c6e-9ffb-c595e9bc031d' AS UUID), 1477933114, 8647082, CAST('2017-03-17T10:02:57.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('1b9b851b-a27f-55a3-98db-5354a9786728' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('1b9b851b-a27f-55a3-98db-5354a9786728' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('1b9b851b-a27f-55a3-98db-5354a9786728' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b9b851b-a27f-55a3-98db-5354a9786728' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d38572e9-971a-5dc8-b23d-a07627812921' AS UUID), CAST('1b9b851b-a27f-55a3-98db-5354a9786728' AS UUID), NULL, 'cleanbandit', 'Our brand new single Symphony with Zara Larsson is out now!!! Eeeek hope you like it!', NULL, CAST('2017-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 264000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d38572e9-971a-5dc8-b23d-a07627812921' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b9b851b-a27f-55a3-98db-5354a9786728' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('780397af-7b57-548c-a08b-4718139c36c9' AS UUID), 'seed-channel:780397af-7b57-548c-a08b-4718139c36c9', '780397af-7b57-548c-a08b-4718139c36c9@catalog.invalid', 'Madonna', CAST('2009-10-27T02:10:38.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-10-27T02:10:38.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('780397af-7b57-548c-a08b-4718139c36c9' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), 'Madonna - Frozen (Official Video) [HD]', 'You’re watching the HD Remastered music video for Madonna’s ''Frozen'', directed by Chris Cunningham. Original song taken from the ''Ray Of Light'' album released on Warner Bros. in 1998. 
Download/Stream the original "Frozen" remixes here: https://Rhino.lnk.to/Frozen
Buy/Stream the ''Ray Of Light'' album here: https://Madonna.lnk.to/RayOfLight 
Listen to Madonna’s latest release here: https://Madonna.lnk.to/latest

Subscribe to the Madonna Channel! https://Madonna.lnk.to/YouTubeID​

Check out the Official Madonna YouTube Playlists…
The Complete Madonna Videography https://Madonna.lnk.to/Videography​
Live Performances https://Madonna.lnk.to/LiveYT​
MDNA Skin https://Madonna.lnk.to/MDNAskinYT​

Help Us Give Back…
Raising Malawi http://www.raisingmalawi.org/​
The Ray of Light Foundation http://www.rayoflight.org/​

Stay in touch with Madonna…
http://madonna.com​
http://instagram.com/madonna​
http://twitter.com/madonna​
http://facebook.com/madonna​
http://www.madonna.com/newsletter​

The Madonna Channel is the official YouTube home for Madonna. As the best-selling female recording artist of all time, Madonna continues to leave an indelible mark on the world through her art, music, activism and humanitarian leadership. Madonna consistently pushes boundaries, spurs conversations and unites us all through her revolutionary work. Subscribe for the latest videos, music, news and updates. Enjoy Madonna’s groundbreaking music videos, live performances, humorous videos and more.

Lyrics:
You only see what your eyes want to see
How can life be what you want it to be
You''re frozen
When your heart''s not open

You''re so consumed with how much you get
You waste your time with hate and regret
You''re broken
When your heart''s not open

Mmmmmm, if I could melt your heart
Mmmmmm, we''d never be apart
Mmmmmm, give yourself to me
Mmmmmm, you hold the key

Now there''s no point in placing the blame
And you should know I suffer the same
If I lose you
My heart will be broken

Love is a bird, she needs to fly
Let all the hurt inside of you die
You''re frozen
When your heart''s not open

Mmmmmm, if I could melt your heart
Mmmmmm, we''d never be apart
Mmmmmm, give yourself to me
Mmmmmm, you hold the key

You only see what your eyes want to see
How can life be what you want it to be
You''re frozen
When your heart''s not open

Mmmmmm, if I could melt your heart
Mmmmmm, we''d never be apart
Mmmmmm, give yourself to me
Mmmmmm, you hold the key

If I could melt your heart
Mmmmmm, we''d never be apart
Mmmmmm, give yourself to me
Mmmmmm, you hold the key

If I could melt your heart

#OfficialMusicVideo #Madonna #Frozen #WeAreWarnerRecords', 22, '/media/9fae61f3-6168-57b8-b30a-3672b99a9271/thumbnail.webp', '/media/9fae61f3-6168-57b8-b30a-3672b99a9271/video.mp4', CAST('780397af-7b57-548c-a08b-4718139c36c9' AS UUID), 313176642, 1901393, CAST('2009-10-27T02:10:38.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bca8ee58-328f-5d85-b999-7e9c407b6743' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'heinkyaw7866', 'Frozen', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bca8ee58-328f-5d85-b999-7e9c407b6743' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e518e1a5-c15e-5205-afda-3848c0b0271a' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'angelamedina7290', '2026 these songs should be now. Timeless. I miss this Madonna   Ray of light', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e518e1a5-c15e-5205-afda-3848c0b0271a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b641e42d-e17e-5dad-98fb-a3d4b1cafd3b' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'maxmirni2768', 'the movie was piss but this is ok', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b641e42d-e17e-5dad-98fb-a3d4b1cafd3b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('66d4b37e-7f3a-5e32-b192-3816f974c394' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'Arashkaman128', '❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤', NULL, CAST('2026-09-30T06:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('66d4b37e-7f3a-5e32-b192-3816f974c394' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d2122466-c2e1-58b1-b68c-8642248ba24e' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'Johannes-HermannWöbse-n1w', 'Take the bitcoins out off youre wallet and invest in blockdag, its me bitcoins inventor, here i tell it here youre rich, never turn back!!!! Dont reswap...wait.. january', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d2122466-c2e1-58b1-b68c-8642248ba24e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d453fa23-1aeb-5286-ba78-944d0c9494a7' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'LucasNicacioGomes', 'Queen of Spiritual Connection 🕉', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d453fa23-1aeb-5286-ba78-944d0c9494a7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('70d414e5-af85-5d21-8f9a-e198e53f9e70' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'ALLINKAH-1', '✨I agree Madonna 🐦', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('70d414e5-af85-5d21-8f9a-e198e53f9e70' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3afa5d73-30fe-5ee2-9547-9b042a857f36' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'ejaygerald7877', 'Is that Madonna, the Kabbalist? #Kabbalah', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3afa5d73-30fe-5ee2-9547-9b042a857f36' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3153495a-16f6-5f37-b1eb-29ce173bfd69' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'alexferreira4636', 'Minha cantora❤ linda maravilhosa 😍', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3153495a-16f6-5f37-b1eb-29ce173bfd69' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ff0b112c-7cc2-5cac-aeaa-5ed5af599a85' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'feofanmarkov4917', 'Класс!', NULL, CAST('2026-09-29T20:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ff0b112c-7cc2-5cac-aeaa-5ed5af599a85' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fd91511a-9a1d-5c4e-bea8-9202e5c626a2' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'KojiWillBite', 'Year 3026 & I’m here watching late great Madonna', NULL, CAST('2026-09-29T13:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 4
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fd91511a-9a1d-5c4e-bea8-9202e5c626a2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4f07b891-f0ae-53a7-b0ff-907a075d8962' AS UUID), CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID), NULL, 'Jeyder_18', 'Damn hater, what are you doing here??? Mother Madonna will still be alive in 2036, be careful, or you''ll be the one who dies first, you damn dog. Leave the Queen alone. Trash like you ruins the Queen.😂😂😂', NULL, CAST('2026-09-29T18:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4f07b891-f0ae-53a7-b0ff-907a075d8962' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('9fae61f3-6168-57b8-b30a-3672b99a9271' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('8fd2770b-1d88-5c9c-8940-036b8dc9fa1a' AS UUID), 'seed-channel:8fd2770b-1d88-5c9c-8940-036b8dc9fa1a', '8fd2770b-1d88-5c9c-8940-036b8dc9fa1a@catalog.invalid', 'HAZE', CAST('2009-06-26T20:10:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-06-26T20:10:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('8fd2770b-1d88-5c9c-8940-036b8dc9fa1a' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), 'Haze, La Hungara - El Killo', 'Music video by Haze performing El Killo. (C) 2008 Universal Music Spain, S.L.', 36, '/media/01514f54-67ee-5c9d-892d-4813778bd87b/thumbnail.webp', '/media/01514f54-67ee-5c9d-892d-4813778bd87b/video.mp4', CAST('8fd2770b-1d88-5c9c-8940-036b8dc9fa1a' AS UUID), 16590728, 78594, CAST('2009-06-26T20:10:17.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('95f3b7a8-e094-5a37-8e72-a941e1d98749' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'albert23creator87', '@ELHACE .- «Hermano Haze, te escribo esto desde el corazón y con el máximo respeto a tu trabajo. Hoy he vuelto a escuchar El quillo y no he podido evitar que se me caigan las lágrimas al recordar una época de mi vida donde fuimos increíblemente felices. Tus canciones fueron la banda sonora de nuestros mejores años, de paseos inolvidables, risas y momentos dorados que se quedan marcados para siempre.
Gracias por ponerle voz y alma a toda una generación. Con total humildad te digo que lo que creaste no fue solo música, fue vida y recuerdos imborrables para muchos de nosotros. Un abrazo grande y todo mi respeto para tu arte.', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('95f3b7a8-e094-5a37-8e72-a941e1d98749' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a0f0b90c-2b00-5f76-8431-d3f7dd7cef4f' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'jacobortiz3226', 'Septiembre 2026', NULL, CAST('2026-09-25T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a0f0b90c-2b00-5f76-8431-d3f7dd7cef4f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ebc69ea5-c47b-59dd-bbc0-40c3b28c6fbe' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'maricarmenabadianavarro2453', 'Deberían cantarla de nuevo', NULL, CAST('2026-09-23T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ebc69ea5-c47b-59dd-bbc0-40c3b28c6fbe' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('06e515b6-aa52-5373-95b3-21789c760c00' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'vanefermi', 'Temazoo 💯 quién lo escucha en 2026?', NULL, CAST('2026-09-18T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 14
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('06e515b6-aa52-5373-95b3-21789c760c00' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0b28fa88-8078-5f5a-917f-bbee53810c4d' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'felixarias8638', 'Solo las leyendas 🙌🙌', NULL, CAST('2026-09-19T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0b28fa88-8078-5f5a-917f-bbee53810c4d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a6c6dc80-64a3-5038-bb15-864bd9913add' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'alejandrojimenez6424', 'Tu música jamás pasará de moda tío', NULL, CAST('2026-09-17T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a6c6dc80-64a3-5038-bb15-864bd9913add' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a615ffe9-6e53-57f6-bdbb-1bf80ad66ddc' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'antoniogamezzafra7922', 'Tiene la cancion mas años que yo y el mes que viene voy a su concierto', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a615ffe9-6e53-57f6-bdbb-1bf80ad66ddc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('28ba6504-bf19-5e23-85a8-0619d8329fcc' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'ricardodias5506', '2026', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('28ba6504-bf19-5e23-85a8-0619d8329fcc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('897a2779-11e2-5f44-98ec-70fb00e9778e' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'ALEPRO-td9iq', 'Quien 1 de septiembre de 2026? Temazooo', NULL, CAST('2026-09-02T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 24
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('897a2779-11e2-5f44-98ec-70fb00e9778e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5c5061fd-6fa6-591c-9f64-b4f45f6471ad' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'saramariareguera6173', 'Yyooo', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5c5061fd-6fa6-591c-9f64-b4f45f6471ad' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d32534c2-b94d-560c-bc75-f0368016eaad' AS UUID), CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID), NULL, 'tonycrack5738', 'Conor playlist: 💃&🏖&👴🏿&🎵', NULL, CAST('2026-09-02T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d32534c2-b94d-560c-bc75-f0368016eaad' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('01514f54-67ee-5c9d-892d-4813778bd87b' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('b6253f21-8e28-53d9-b4c8-20825ea47d0c' AS UUID), 'seed-channel:b6253f21-8e28-53d9-b4c8-20825ea47d0c', 'b6253f21-8e28-53d9-b4c8-20825ea47d0c@catalog.invalid', 'Estopa', CAST('2009-10-25T06:50:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2009-10-25T06:50:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('b6253f21-8e28-53d9-b4c8-20825ea47d0c' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), 'Estopa - Como Camaron (Videoclip)', 'Estopa - Como Camarón 
Escucha los éxitos de Estopa: https://youtube.com/playlist?list=PLdlGSv-ev-y00UhUMNKIBoCcFqzq9mafT&si=y_JgbxGz6SAIZIEV

Escucha más de Estopa:
Spotify: https://open.spotify.com/intl-es/artist/5ZqnEfVdEGmoPxtELhN7ai?si=7_GcMyDRR7O0WDsEJz41Qg
Amazon Music: https://music.amazon.es/artists/B008KGZWFO/estopa
Apple Music: https://music.apple.com/es/artist/estopa/27384332
YouTube Music: https://music.youtube.com/channel/UCd25mqkTos06xFf1RP9qFJA

Sigue a Estopa:
Website: https://www.estopa.com/
Instagram: https://www.instagram.com/estopaoficial/
Facebook: https://www.facebook.com/estopaoficial
Twitter: https://x.com/estopaoficial
TikTok: https://www.tiktok.com/@estoesestopaoficial
---------
Letra: 
Superior a mí
Es la fuerza que me lleva
En el pulso que mantengo
Con la oscuridad que tiñen
De oscuro tus ojos negros
Y qué me cuentas del tiempo
Que pasa en tu pestañeo
Y que me trae por esta calle
De amargura y de lamento
Que yo sé que la sonrisa
Que se dibuja en mi cara
Tiene que ver con la brisa
Que abanica tu mirada
Tan despacio y tan deprisa
Tan normal y tan extraña
Yo me parto la camisa
Como Camarón
Tú me rompes las entrañas
Me trepas como una araña
Bebes del sudor que empaña
El cristal de mi habitación
Y después, por la mañana
Despierto y no tengo alas
Llevo diez horas durmiendo
Y mi almohada está empapada
Todo había sido un sueño
Muy real y muy profundo
Tus ojos no tienen dueño
Porque no son de este mundo
Que no te quiero mirar
Pero es que cierro los ojos
Y hasta te veo por dentro
Te veo en un lado y en otro
En cada foto, en cada espejo
Y en las paredes del metro
Y en los ojos de la gente
Hasta en la sopa más caliente
Loco, yo me estoy volviendo
Que yo sé que la sonrisa
Que se dibuja en mi cara
Tiene que ver con la brisa
Que abanica tu mirada
Tan despacio y tan deprisa
Tan normal y tan extraña
Yo me parto la camisa
Como Camarón
Tú me rompes las entrañas
Me trepas como una araña
Bebes del sudor que empaña
El cristal de mi habitación
Y después por la mañana
Despierto y no tengo alas
Llevo diez horas durmiendo
Y mi almohada está empapada
Todo había sido un sueño
Muy real y muy profundo
Tus ojos no tienen dueño
Porque no son de este mundo
Y, a veces, me confundo
Y pico a tu vecina
Esa del segundo
Que vende cosa fina
Y, a veces, te espero
En el bar de la esquina
Con la mirada fija en tu portería
Y, a veces, me como
De un boca''o el mundo
Y, a veces, te siento
Y, a veces, te tumbo
A veces, te leo un beso en los labios
Y, como yo no me atrevo
Me corto y me abro
Que yo sé que la sonrisa
Que se dibuja en mi cara
Tiene que ver con la brisa
Que abanica tu mirada
Tan despacio y tan deprisa
Tan normal y tan extraña
Yo me parto la camisa
Como Camarón
Tú me rompes las entrañas
Me trepas como una araña
Bebes del sudor que empaña
El cristal de mi habitación
Y después por la mañana
Despierto y no tengo alas
Llevo diez horas durmiendo
Y mi almohada está empapada
Todo había sido un sueño
Muy real y muy profundo
Tus ojos no tienen dueño
Porque no son de este mundo

#Estopa #ComoCamaron', 23, '/media/ff995b97-4067-5936-84a4-524823823e2d/thumbnail.webp', '/media/ff995b97-4067-5936-84a4-524823823e2d/video.mp4', CAST('b6253f21-8e28-53d9-b4c8-20825ea47d0c' AS UUID), 76457154, 259055, CAST('2009-10-25T06:50:34.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('53f66810-6dec-5e13-a804-7cda4c5a832e' AS UUID), CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), NULL, 'Linchiartidesu', 'Cada vez que escucho esta canción me acuerdo del viejo Auronplay 🫶🏻', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('53f66810-6dec-5e13-a804-7cda4c5a832e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7edc1c81-8e96-528d-93e1-e4102f3bf0ce' AS UUID), CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), NULL, 'MarcosBucetaRuibal-x5t', 'Viva la Roja', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7edc1c81-8e96-528d-93e1-e4102f3bf0ce' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('526e206d-8f29-5a40-9212-3c5e40576463' AS UUID), CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), NULL, 'andahiszpania5849', 'Superior a mí
Es la fuerza que me lleva en el pulso
Que mantengo con la oscuridad
Que tiñen de oscuro tus ojos negros
Y que me cuentas del tiempo
Que pasa en tu pestañeo
Y que me trae por esta calle
De amargura y de lamento
Que yo sé que la sonrisa
Que se dibuja en mi cara
Tiene que ver con la brisa
Que abanica tu mirada
Tan despacio y tan deprisa
Tan normal y tan extraña
Yo me parto la camisa
Como camarón
Tú me rompes las entrañas
Me trepas como una araña
Bebes del sudor que empaña
El cristal de mi habitación
Y después por la mañana
Despierto y no tengo alas
Llevo diez horas durmiendo
Y mi almohada está empapada
Todavía ha sido un sueño
Muy real y muy profundo
Tus ojos no tienen dueño
Porque no son de este mundo
Que no te quiero mirar
Pero es que cierro los ojos
Y hasta te veo por dentro
Te veo en un lado y en otro
En cada foto, en cada espejo
Y en las paradas del metro
Y en los ojos de la gente
Hasta en las sopas más calientes
Loco yo me estoy volviendo
Que yo sé que la sonrisa
Que se dibuja en mi cara
Tiene que ver con la brisa
Que abanica tu mirada
Tan despacio y tan deprisa
Tan normal y tan extraña
Yo me parto la camisa
Como camarón
Tú me rompes las entrañas
Me trepas como una araña
Bebes del sudor que empaña
El cristal de mi habitación
Y después por la mañana
Despierto y no tengo alas
Llevo diez horas durmiendo
Y mi almohada está empapada
Todavía ha sido un sueño
Muy real y muy profundo
Tus ojos no tienen dueño
Porque no son de este mundo
Y a veces me confundo
Y pico a tu vecina
Esa del segundo que vende cosas finas
Y a veces te espero
En el bar de la esquina
Con la mirada fija en tu portería
Y a veces me como de un bocao'' el mundo
Y a veces te siento
Y a veces te tumbo
A veces te leo un beso en los labios
Y como yo no me atrevo
Me corto y me abro
Que yo sé que la sonrisa
Que se dibuja en mi cara
Tiene que ver con la brisa
Que abanica tu mirada
Tan despacio y tan deprisa
Tan normal y tan extraña
Yo me parto la camisa
Como camarón
Tú me rompes las entrañas
Me trepas como una araña
Bebes del sudor que empaña
El cristal de mi habitación
Y después por la mañana
Despierto y no tengo alas
Llevo diez horas durmiendo
Y mi almohada está empapada
Todavía ha sido un sueño
Muy real y muy profundo
Tus ojos no tienen dueño
Porque no son de este mundo', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('526e206d-8f29-5a40-9212-3c5e40576463' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e239dc54-ecd5-520a-837a-c3de1f7ae282' AS UUID), CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), NULL, 'josemanuelsanchez692', 'La mejor canción de Estopa', NULL, CAST('2026-09-27T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e239dc54-ecd5-520a-837a-c3de1f7ae282' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c79ba658-e2e8-52dd-8c5d-6a24e21f9f18' AS UUID), CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), NULL, 'elenabriozzo6547', '2026 en La Juanita, Uruguay', NULL, CAST('2026-09-22T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c79ba658-e2e8-52dd-8c5d-6a24e21f9f18' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('050372b5-23ec-5938-8bb1-a81449d81f7c' AS UUID), CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), NULL, 'jhurtadoe74', 'WOW!!!! Volvi a la adolescencia!!!', NULL, CAST('2026-09-21T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('050372b5-23ec-5938-8bb1-a81449d81f7c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1a13a8cd-aa1f-53a4-9ab1-ebf8b453b84d' AS UUID), CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID), NULL, 'TOMEUBASSA', 'h', NULL, CAST('2026-09-21T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1a13a8cd-aa1f-53a4-9ab1-ebf8b453b84d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ff995b97-4067-5936-84a4-524823823e2d' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('a8d91a70-c6b2-59ba-911f-d9c10c8dc42b' AS UUID), 'seed-channel:a8d91a70-c6b2-59ba-911f-d9c10c8dc42b', 'a8d91a70-c6b2-59ba-911f-d9c10c8dc42b@catalog.invalid', 'Porta', CAST('2017-03-15T19:00:15.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2017-03-15T19:00:15.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('a8d91a70-c6b2-59ba-911f-d9c10c8dc42b' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), 'PORTA | BRUCE WAYNE | VIDEO OFICIAL', '➜ 🔔 Haz CLICK en la campana para activar notificaciones

➜ Contratación: info@realporta.com

● ACTIVA LOS SUBTITULOS PARA VER LA LETRA.


▬▬▬▬▬ SÍGUEME MIS  REDES SOCIALES ▬▬▬▬    

● INSTAGRAM:  https://instagram.com/realporta/
● FACEBOOKk: https://www.facebook.com/Porta
● TIKTOK : https://www.tiktok.com/@realporta
● TWITCH: https://www.twitch.tv/porta
● SUSCRÍBETE: https://www.youtube.com/realp0rta

▬▬▬▬▬▬▬  MÁS DE MI MÚSICA  ▬▬▬▬▬▬▬   

➜ Porta en Spotify:
 https://open.spotify.com/artist/3p7Bs02UWDt5ENoJeUGqaB?si=r-2I1TJ6SeWEc29AAku5tQ

➜ Porta en Itunes Itunes: 
 https://itunes.apple.com/es/artist/porta/272482359

▬▬▬▬▬▬▬▬ PÁGINA OFICIAL ▬▬▬▬▬▬▬▬  

➜ WWW.REALPORTA.ES


↪Créditos canción:

Letra: Porta
Beat: Soma
Grabado en Lebuqe por Zpu
Mezcla y máster a cargo de Soma

Letra:

Yo me he ganado el ir con traje y corbata
Brindo con champange, tu con cubatas soy un gentleman
Hiphop he podido sentir lo mal que me tratas
Tengo una doble vida y una casi me mata, man.
Por eso oculto mi verdadera cara
No estáis preparados para verla clara, todavía
Si me fuera de la lengua o si yo te contara
La mierda que inventaron quizás les salpicaría.
Juega tus cartas, yo me guardaré los ases
No podrías comprar con todo tu dinero tanta clase 
Se creen profesores y les falta educación
Tomad asiento, presiento que os toca aprender la lección.
Así no conseguiréis que os promocione
Aquí no valen tus palabras solo las acciones.
Ya crecí , no respondo a las provocaciones
Buscan beef, solo por un puñado de reproducciones.
Y Ahí se ve la parte humana
Acaso contarías cosas personales de gente cercana
Yo no soy tóxico ni corrosivo
como va enseñarme todo uno que solo rima con infinitivos.
Yo valoro la amistad aunque se rompa
Y respeto al que algún día fue parte mi 
Nunca jamás me verás hablando mal de un compa’
Porque todos tendríamos cosas feas para decir.


Estribillox2
Todos tenemos dos caras aunque no lo admitas
Yo no busco aplausos aunque otros los necesitan
Damas y caballeros, señores y señoritas
No soy lo que el Hiphop quiere sino lo que necesita 


No planeo mis días, solo fluyo
Por ignorar aveces parece que huyo
Pienso cada uno su camino y a lo suyo
Solo vivo, y aparto de mi vida a los ca…(tsshh)
Me juzgáis y todo lo que os cuentan lo creéis
Pero hay, mucho por detrás que no sabéis
Cuando miréis hacia atrás, cuando menos lo esperéis
Y crezcáis, ya veréis aquí todos somos Bruce Wayne
Valgo mas por todo lo que callo
No voy a joderte y voy a perdonar tus fallos
Para brillar no tengo que apagarte ni hacer daño
Ya No juego a vuestros juego me acerco a los 30 años.
Menos ir de pro y mas criterio
Si es entre tu y yo, no metas a nadie mas de por medio
Sé un poco mas serio, en serio
¿No te has preguntado porque no has triunfado? Menudo misterio
Sincero, pase lo que pase, pese a quien le pese
Alejo a los judas, pa’ que no me besen
Ellos traen comida rápida, yo delicatessen
Solo hago rap, la prensa rosa pa quien le interese.
Lo personal me lo guardare para mi
Yo no voy a ir a las redes sociales a llorar
No me preocupa lo mas mínimo lo que puedan decir
Aquí Todos tenemos cosas feas para contar.

Estribillox2
Todos tenemos dos caras aunque no lo admitas
Yo no busco aplausos aunque otros los necesitan
Damas y caballeros, señores y señoritas
No soy lo que el Hiphop quiere sino lo que necesita 

Hay cosas que no cuadran en gran parte de esa historia
Dicen que a los cerdos les llega su San Martín
Sabes que la vida da mas vueltas que una noria
Yo no tengo que hacer nada, tu karma lo hará por mi
Estoy tranquilo y en calma, 
Lo hago de otra forma no quiero ensuciarme el alma
Y tampoco el traje, hoy traje la felicidad en mi palma
No abogo a la violencia, la indiferencia es mi arma.
Sueñan con la fama y yo con perderla de vista
Si llevo máscara para no ser protagonista
Soy un idealista,
Yo No venderé tu culo para que mi cara sea portada de revista.
Orgulloso de no ser solo otro oportunista
Todo lo que tengo lo he conseguido por mi
Y sin hacer nada sucio, como gran parte de artistas
Que necesitan de otros solo pa intentar subir.
Lo llaman interés, sé lo que intentas hacer
Por eso hoy traigo un bonito marco solo para usted
Quedas retratado, siempre has manipulado a merced
Yo ya pedí perdón por cada error si me equivoqué 
Pero No caeré en las trampas, de esos que vienen y van
Vosotros mordéis la misma mano que os ha dado el pan
Yo Cargaré con la culpa y no posesionaré al fan
Cuando les falta razón solo tratan de inventar.

Estribillox2
Todos tenemos dos caras aunque no lo admitas
Yo no busco aplausos aunque otros los necesitan
Damas y caballeros, señores y señoritas
No soy lo que el Hiphop quiere sino lo que necesita', 74, '/media/dc3dfb56-82da-5ae9-9457-251c78d65bba/thumbnail.webp', '/media/dc3dfb56-82da-5ae9-9457-251c78d65bba/video.mp4', CAST('a8d91a70-c6b2-59ba-911f-d9c10c8dc42b' AS UUID), 27514104, 335090, CAST('2017-03-15T19:00:15.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('32b188e2-a9bf-5034-baf7-6662767df4c0' AS UUID), CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), NULL, 'porta', 'Para los que no acaban de comprender el video: Aquí se representan las dos caras de una misma moneda. Muchos decidimos ir por el mismo camino (En este caso son ladrones), pero cada uno decide actuar de una manera muy distinta al otro.', NULL, CAST('2017-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 31000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('32b188e2-a9bf-5034-baf7-6662767df4c0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bd025a3e-6f65-5bf9-a5f3-d657b811280d' AS UUID), CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), NULL, 'AxflowMusic', 'Porta entonces se podría decir que tanto tú como los otros actores son ladrones pero tú eres un ladrón más sofisticado y elegante que los otros ? Jajaja el vídeo es bueno pero esperaba más referencias a Batman', NULL, CAST('2017-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 37
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bd025a3e-6f65-5bf9-a5f3-d657b811280d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('288dc6a3-e2f6-559b-bb13-5a263a6f1b7b' AS UUID), CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), NULL, 'AlexJDavila', 'Ami no me engañas que indirecta para santaflow :v', NULL, CAST('2017-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 24
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('288dc6a3-e2f6-559b-bb13-5a263a6f1b7b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cdab644a-d26b-59be-9ada-57a163a990ba' AS UUID), CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), NULL, 'xenoxg2596', 'en realidad eso le queda al mismo porta, quizá el diga que no tiene que ver esto con respuesta a nada o a nadie, pero el caso que es una indirecta, no tanto a santa, tambien a mucha gente que lo criticó/critica, solo digo', NULL, CAST('2017-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 22
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cdab644a-d26b-59be-9ada-57a163a990ba' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7024c0b1-bee3-568d-a7d8-ca76a0b693b8' AS UUID), CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), NULL, 'enyeldiaz7482', 'Porta eso sono a una respuesta para santaflow por cartas sobre la mesa', NULL, CAST('2017-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 11
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7024c0b1-bee3-568d-a7d8-ca76a0b693b8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('88d5452d-06a5-5d72-abc9-c766e0e1f3d7' AS UUID), CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), NULL, 'francoapril1963', 'Porta eres el mejor y santa también xd', NULL, CAST('2017-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 10
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('88d5452d-06a5-5d72-abc9-c766e0e1f3d7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bdb3f9a3-4d86-511e-8149-40976c3508a6' AS UUID), CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID), NULL, 'subscriptoressinningunvi-qo7vq', 'Porta k genial el video', NULL, CAST('2017-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 9
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bdb3f9a3-4d86-511e-8149-40976c3508a6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('dc3dfb56-82da-5ae9-9457-251c78d65bba' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('b44f6a69-d8eb-50d1-b484-7c08dc6553c5' AS UUID), 'seed-channel:b44f6a69-d8eb-50d1-b484-7c08dc6553c5', 'b44f6a69-d8eb-50d1-b484-7c08dc6553c5@catalog.invalid', 'Daddy Yankee', CAST('2019-01-24T04:06:52.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2019-01-24T04:06:52.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('b44f6a69-d8eb-50d1-b484-7c08dc6553c5' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), 'Daddy Yankee & Snow - Con Calma (Video Oficial)', 'Daddy Yankee & Snow
Con Calma (Video Oficial)
Subtítulos Disponible ✅  Letra Oficial👇

Escucha en tu plataforma favorita:
Spotify: http://open.spotify.com/album/1otwHKoQ5KPaiekpYk4tWh
Apple Music: https://itunes.apple.com/us/album/con-calma-feat-snow-single/1449106551?ls=1
YouTube Music: https://music.youtube.com/watch?v=GQwj_FRntp8
Google Play: https://play.google.com/music/preview/B2c3ccp6bktt2wepc5zw2momscy
Tidal: https://listen.tidal.com/track/102570097  
Deezer: https://www.deezer.com/en/album/84880812
Pandora: http://pandora.com/artist/daddy-yankee/con-calma-single/AL4gwvwJ93ZltfZ
Gaana: https://gaana.com/song/con-calma-4

Sigue a DY:
Facebook-http://goo.gl/QYZ53a | Twitter-http://goo.gl/AzaR8o 
Instagram-http://goo.gl/a6F7gz | www.daddyyankee.com

Con Calma Letra:
Cómo te llamas baby?
Desde que te vi supe que eras pa’ mi
Dile a tus amigas que andamos ready
Esto lo seguimos en el after party

Cómo te llamas baby?
Desde que te vi supe que eras pa’ mi
Dile a tus amigas que andamos ready
Esto lo seguimos en el after party

Con calma yo quiero ver como ella lo menea
Mueve ese “poom poom” girl
es una asesina cuando baila quiero que to’ el mundo la vea
I like your “poom poom” girl 
Con calma yo quiero ver como ella lo menea
Mueve ese “poom pomm” girl
Tiene adrenalina en medio de la pista vente hazme lo que sea
I like your “poom poom” girl 

Ya vi que estás solita acompáñame
La noche es de nosotros tú lo sabes
Que ganas me dan dan dan
De guayarte mami ese rampampam! Yeah!
Esa criminal como lo mueve es un delito
Tengo que arrestarte porque empiezo y no me quito
Tienes criminality pero te doy fatality
Vívete la película flotando en mi gravity
Daddy pone las reglas tienes que obedecer
Mami no tiene pausa qué es lo que vas hacer?
Échale échale échale pa’ tras
Échale échale  pa’ lante y pa’ tras

Con calma yo quiero ver como ella lo menea
Mueve ese “poom poom” girl
es una asesina cuando baila quiere que to’ el mundo la vea
I like your “poom poom” girl 
Con calma yo quiero ver como ella lo menea
Mueve ese “poom pomm” girl
Tiene adrenalina en medio de la pista vente hazme lo que sea
I like your “poom poom” girl 

Tú tienes candela y yo tengo la vela
Llama al 911 se están quemando las suelas
Me daña cuando la faldita esa me la modela
Mami estás enferma pero tu show no lo cancelas
Te llaman a ti la reina del party
Mucha sandunga tiene ese body
Tírate un paso no no pare wow dale dale!
Somos dos bandidos entre la rumba y romance
Zúmbale dj otra vez pa’ que dance
Échale échale échale pa’ tras
Échale échale pa’ lante y pa’ tras

Con calma yo quiero ver como ella lo menea
Mueve ese “poom poom” girl
es una asesina cuando baila quiere que to’ el mundo la vea
I like your “poom poom” girl 
Con calma yo quiero ver como ella lo menea
Mueve ese “poom pomm” girl
Tiene adrenalina en medio de la pista vente hazme lo que sea
I like your “poom poom” girl 

Come with a nice young lady
Intelligent, yes she gentle and irie
Everywhere me go me never lef'' her at all-ie
Yes-a Daddy Snow me are the roam dance man-a
Roam between-a dancin'' in-a in-a nation-a
You never know say daddy me Snow me are the boom shakata
Me never lay-a down flat in-a one cardboard box-a
Yes-a daddy  yankee  me-a go reachin'' out da top,

Con calma yo quiero ver como ella lo menea
Mueve ese “poom poom” girl
es una asesina cuando baila quiere que to’ el mundo la vea
I like your “poom poom” girl 
Con calma, ya'' no say daddy me Snow me I go blame
I like your “poom poom” girl 
''Tective man a say, say daddy me Snow me stab someone down the lane
I like your “poom poom” girl 

This is the official Youtube channel from urban music legend, Daddy Yankee who has sold over 40 million records on his career. Major hits are Gasolina, Pose, Rompe, Dura, Despacito, among others. For product integration contact: info@nevarezpr.com

#DaddyYankee #ConCalma', 31, '/media/0a49676b-5317-5da6-8daa-6caec44ac1c1/thumbnail.webp', '/media/0a49676b-5317-5da6-8daa-6caec44ac1c1/video.mp4', CAST('b44f6a69-d8eb-50d1-b484-7c08dc6553c5' AS UUID), 3222287322, 15222256, CAST('2019-01-24T04:06:52.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e57ce69f-b454-5942-9486-132c4fa84d3f' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'DaddyYankee', 'Buen día familia! Los invito escuchar mi nuevo tema ‘Bailando en la Lluvia’. 🌦☀ Una canción que nació gracias a ustedes y espero los invite a bailar en medio de la tormenta. 🎶🕺🏽💃🏽https://www.youtube.com/watch?v=6DB6DS1ODIk&ab_channel=DaddyYankee', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 19000
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e57ce69f-b454-5942-9486-132c4fa84d3f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6059155a-54ae-5341-864a-a67f4a325c74' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'monicachirinos8630', 'Te amo te amo soy tu fan', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 16
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6059155a-54ae-5341-864a-a67f4a325c74' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b467347a-a333-5303-928f-b4b41fb4ecdc' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'AndresSuarez-ne4yg', 'El mejor de todos los tiempos❤❤', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 12
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b467347a-a333-5303-928f-b4b41fb4ecdc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('18dd463b-d5a0-5d67-91fc-f73b9fe44c82' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'VictoriaAlvarez-d6y', 'Todos cantan unas canciones tan divertidas y me gustan me quedé sin palabras esas canciones son unas canciones sonrisa 😃😊🎉 quién cumple años ella que están haciendo esa fiesta 🥳 el que cumpla años que traiga los pasteles el bizcocho papel 🎂🍦🍩🍫🥪🍕 todos los emojis de comida tienen que traer allí por esa fiesta porque están haciendo como un cumpleaños por esa fiesta 🎉🥳', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 7
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('18dd463b-d5a0-5d67-91fc-f73b9fe44c82' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('45c25089-c405-5b4c-97fd-68210456c3e6' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'alejandrodevany6095', 'Hola soy tu mayor fan e escuchado todas tus canciones', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 3
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('45c25089-c405-5b4c-97fd-68210456c3e6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d1115e8e-b84b-58c8-917d-c21f37856172' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'andreavaldez3530', 'Al lado de dyant y VIP a mi pareja eres muy bonito con mis chootes ojo te amo mi mi padre miraría🎉', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d1115e8e-b84b-58c8-917d-c21f37856172' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0205babd-9854-5f10-b3da-eb3ffefc06ec' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'madina_28-y8h', 'Ты лучший обожаю твои треки', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0205babd-9854-5f10-b3da-eb3ffefc06ec' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('adbd032e-2865-5d8c-9949-f61463704344' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'zoilalonga6069', 'Saludame  soy fanny me encanta la música a haces 🎉🎉🎉🎉🎉', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 21
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('adbd032e-2865-5d8c-9949-f61463704344' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1ca3650b-0ec4-5c5c-ac5f-b776b5d954a2' AS UUID), CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID), NULL, 'soloyo-vo7bd', 'Vamos crack', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 59
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1ca3650b-0ec4-5c5c-ac5f-b776b5d954a2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0a49676b-5317-5da6-8daa-6caec44ac1c1' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('616853fc-5a76-52e6-9fa5-b9d06402e374' AS UUID), 'seed-channel:616853fc-5a76-52e6-9fa5-b9d06402e374', '616853fc-5a76-52e6-9fa5-b9d06402e374@catalog.invalid', 'Rudimental', CAST('2013-04-04T09:17:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2013-04-04T09:17:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('616853fc-5a76-52e6-9fa5-b9d06402e374' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('ae9ba197-c453-5a3f-b110-5fd6d238ca10' AS UUID), 'Rudimental - Waiting All Night (ft. Ella Eyre) [Official Video]', 'The official music video for Rudimental - Waiting All Night ft. @EllaEyre 

The official video for ''Waiting All Night'' is the inspirational true life-story of San Francisco-born BMX champion and actor, Kurt Yaeger, who became an amputee after an accident in 2006. All the characters in the clip are pro BMXers and friends of Kurt.

For more information on Kurt and to ask him any questions on his experiences and the world of BMX, you can contact him here: 
http://kurtyaeger.com
http://www.facebook.com/KurtYaegerFanpage
http://twitter.com/kurtyaeger
http://instagram.com/kurtyaeger

Taken from their debut studio album ''Home'' released in 2013, which featured the hit singles ''Spoons'', ''Feel The Love'', ''Not Giving In'', ''Waiting All Night'', ''Right Here'', ''Free'', ''Powerless'' & ''Give You Up''.

Subscribe to the Rudimental channel for all the best and latest official music videos, behind the scenes and live performances. 
http://bit.ly/SubscribeToRudimental

See more official videos from Rudimental here:
https://www.youtube.com/playlist?list=PLhRApTKQaXd_lmApFRZh_IGJWSr9HroGL

Listen to more from the album Home: https://www.youtube.com/playlist?list=PLhRApTKQaXd_oEjSkwOPXjtKuDAyKsSoG

Follow Rudimental:
http://www.rudimental.co.uk 
http://www.facebook.com/rudimentaluk 
http://www.twitter.com/rudimentaluk 
http://www.instagram.com/rudimentaluk
http://www.soundcloud.com/rudimentaluk

VIDEO CREDITS:
BMXers:
Aaron Nardi (http://twitter.com/aaronnardi)
Jush Allen (http://twitter.com/jushallen)
Huy Doan (http://twitter.com/huydoan)
Ryan Metro (http://twitter.com/Ryan_Metr0)
Jimmy Levan (http://www.metalbikesbmx.com/metal_jimmy.html)
Danny Downey (http://www.facebook.com/danny.downey.7)

Director: Nez 
Production Company: Riff Raff Films (http://www.riffrafffilms.tv/)
Director Of Photography: Larkin Seiple
Editor: Max Windows

About Rudimental:
Rudimental are a London-based electronic outfit consisting of Piers Aggett, Amir Amor, Kesi Dryden and Leon "Locksmith" Rolle, renowned for their energetic live shows and high profile collaborations. 

Their catalogue boasts the Mercury Prize nominated and Brit Award winning debut album “Home", as well as albums "We The Generation", "Toast to Our Differences" and 2021''s "Ground Control".

These have spawned hits such as “Feel The Love”, “Not Giving In”, "Waiting All Night", “Bloodstream”, "Never Let You Go", "Lay It All On Me", "Sun Comes Up", "These Days" and "Let Me Live" which has seen them collaborate with a wide range of artists including; Ed Sheeran, James Arthur, Jess Glynne, Macklemore, Anne-Marie, Tom Walker, Rita Ora, John Newman, Foy Vance, Ella Eyre and many others.

#Rudimental #EllaEyre #WaitingAllNight #Home', 28, '/media/ae9ba197-c453-5a3f-b110-5fd6d238ca10/thumbnail.webp', '/media/ae9ba197-c453-5a3f-b110-5fd6d238ca10/video.mp4', CAST('616853fc-5a76-52e6-9fa5-b9d06402e374' AS UUID), 280408425, 1244727, CAST('2013-04-04T09:17:29.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('ae9ba197-c453-5a3f-b110-5fd6d238ca10' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('ae9ba197-c453-5a3f-b110-5fd6d238ca10' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('ae9ba197-c453-5a3f-b110-5fd6d238ca10' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ae9ba197-c453-5a3f-b110-5fd6d238ca10' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4ddd2100-9836-50c1-a5d4-3fce23977269' AS UUID), CAST('ae9ba197-c453-5a3f-b110-5fd6d238ca10' AS UUID), NULL, 'MáraMarta-b3l', 'Krásná ❤', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4ddd2100-9836-50c1-a5d4-3fce23977269' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('ae9ba197-c453-5a3f-b110-5fd6d238ca10' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), 'Daddy Yankee - Limbo (Video Oficial)', 'Daddy Yankee - "Limbo" (Video Oficial)
Spotify: https://goo.gl/LPP4j9
Apple Music: https://goo.gl/s8omcv
Google Play: https://goo.gl/d9V2VV
Tidal: https://goo.gl/44UiYx
Deezer: https://goo.gl/11jHih

Facebook-http://goo.gl/QYZ53a
Twitter-http://goo.gl/AzaR8o 
Instagram-http://goo.gl/a6F7gz 
www.daddyyankee.com

Daddy Yankee - Con Calma (Video Oficial)
https://youtu.be/DiItGE3eAyQ

Subscribe here: https://goo.gl/kuWQZJ', 29, '/media/a6fa303f-94c0-5976-9918-cf254959d311/thumbnail.webp', '/media/a6fa303f-94c0-5976-9918-cf254959d311/video.mp4', CAST('b44f6a69-d8eb-50d1-b484-7c08dc6553c5' AS UUID), 1512210244, 5566543, CAST('2012-10-27T14:36:43.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0dca9106-496f-5596-ae19-d0c0c04c7093' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'mister_tube44', 'Prestige

PRESENTS

Official Video "Limbo" by Daddy Yankee.

Daddy Yankee - Limbo (Official Video) | Prestige

LETRA

You know
¡Masivo!
We run the world
¡Daddy!
Vamos cógele el ritmo, cintura, rodilla al piso
Baja y pasa el limbo (nos fuimo'' a fuego)
Vamos cógele el ritmo, cintura, rodilla al piso
Baja y pasa el limbo (limbo)
Y esto está como, como pa, como pa, como pa rumbiar
Pa pasarla caliente (¡masivo!), con toda mi gente (''til tomorrow)
Nos favorece el sol, tu bronceado y el calor
No puede estar mejor
¡Zu-zu-zumba!
Y esto está como, como pa, como pa, como pa rumbiar
Pa bailarlo caliente, de espalda y de frente
Nos favorece el sol, tu bronceado y el calor (¡masivo!)
No puede estar mejor
¡Zu-zu-zumba!
Súbela, bájala y por debajo pásala
Suelta la cadera y mueve to lo que tienes ahí
Sigue, síguelo así, que este party no tiene fin
Activao, brinca la casa candela, gasta las suelas
Funde esa tela, sígueme el paso, ¿qué?
Suena, la rumba es buena, que hay muchas nenas
Mira la escena, ¿qué? (Go, go, go)
Oh-eh-oh
Mano arriba, no la dejes caer
Oh-eh-oh
Seguimo'' hasta el amanecer (go, go, go!)
Vamos cógele el ritmo, cintura, rodilla al piso
Baja y pasa el limbo (DY controlando)
Vamos cógele el ritmo, cintura, rodilla al piso
Baja y pasa el limbo (yo, Luny, there you go)
Y esto está como, como pa, como pa, como pa rumbiar
Pa pasarla caliente, con toda mi gente (¡zumba!)
Nos favorece el sol, tu bronceado y el calor
No puede estar mejor
¡Zu-zu-zumba!
Y esto está como, como pa, como pa, como pa rumbiar
Pa bailarlo caliente, de espalda y de frente
Nos favorece el sol, tu bronceado y el calor
No puede estar mejor
¡Zu-zu-zumba!
Bailando, así es que me gusta
Como la cintura al ritmo se ajusta
Es que me tiene loco tanta soltura
Ese movimiento es una dulzura
No importa la'' banderas
Se forma y sal pa fuera
Aquí cabe to el que quiera
No lo pare ahora
Dime, oh-eh-oh
Mano arriba, no la dejes caer (sube, sube)
Oh-eh-oh
Seguimo'' hasta el amanecer
Mi vida, llegando de Aruba, gozando la temperatura
Yo (¿cómo?) te vi bailando el limbo (DY controlando el área, boy)
Me barriste puesto en la esquina, DJ par de bocina (sube, su-sube)
Sí, todos llegarán por el ritmo (go-go-go-go-go-go)
Porque esto-
Y esto está como, como pa, como pa, como pa rumbiar
Pa pasarla caliente, con toda mi gente (ven, síguelo)
Nos favorece el sol, tu bronceado y el calor (persíguelo)
No puede estar mejor
¡Zu-zu-zumba!
Y esto está como, como pa, como pa, como pa rumbiar (persíguelo)
Pa bailarlo caliente (¿cómo?), de espalda y de frente (persíguelo)
Nos favorece el sol, tu bronceado y el calor (¡ma-ma-masivo!)
No puede estar mejor
¡Zu-zu-zumba!
¡Ma-ma-masivo!
¡Ma-ma-masivo!
¡Ma-ma-masivo!
¡Da-Da-Daddy Yankee, yo!
¡Ma-ma-masivo!
¡Ma-ma-masivo!
¡Ma-ma-masivo!
Daddy Yankee, yo-yo-yo-yo-yo', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0dca9106-496f-5596-ae19-d0c0c04c7093' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('af225778-9e49-56e9-abab-e26ac19e4267' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'AxelfranciscoSalinasjaña-c7c', '❤❤❤❤❤❤❤❤🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥', NULL, CAST('2026-09-29T21:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('af225778-9e49-56e9-abab-e26ac19e4267' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('275f8261-c144-5c0e-b4a2-df377ff33ab9' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'EzequielJesús-s3l', '2026', NULL, CAST('2026-09-29T19:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('275f8261-c144-5c0e-b4a2-df377ff33ab9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('dfc7da6c-3d85-584d-a1c9-15cb3583d710' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'Mrps2-m3n', 'esto con digital decent queda melo', NULL, CAST('2026-09-29T13:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('dfc7da6c-3d85-584d-a1c9-15cb3583d710' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a7d2ccac-8f32-5869-832e-fc59ba5b0830' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'sherzodsherzodov-kf3km', 'Roman bilat you xuynasn', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a7d2ccac-8f32-5869-832e-fc59ba5b0830' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5cf22778-25cf-5fd4-824b-16b9d0bfc54c' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'sherzodsherzodov-kf3km', 'Daddy yankee you bitig tammomsan olasan', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5cf22778-25cf-5fd4-824b-16b9d0bfc54c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8eca7d24-986d-5daa-8170-6fc7946b6ffd' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'sherzodsherzodov-kf3km', 'Roman you son detka selka', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8eca7d24-986d-5daa-8170-6fc7946b6ffd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('75c21582-c487-55e1-99b8-60dda4d47c30' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'sherzodsherzodov-kf3km', 'Burushgan sikib oldirmn', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('75c21582-c487-55e1-99b8-60dda4d47c30' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e3b66aa3-4157-59d2-8fe1-89a5f5e568ac' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'sherzodsherzodov-kf3km', 'Roman ami aspalga yayamn', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e3b66aa3-4157-59d2-8fe1-89a5f5e568ac' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a10a5ad4-01e3-5c9f-bbb6-607311a543de' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'sherzodsherzodov-kf3km', 'Kotiga sika mn', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a10a5ad4-01e3-5c9f-bbb6-607311a543de' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9fb79106-5f1d-5ef4-89ae-05323a3c19ed' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'sherzodsherzodov-kf3km', 'Basharenga chotir  yuziga', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9fb79106-5f1d-5ef4-89ae-05323a3c19ed' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5fd8e6b0-e329-5a1e-a50b-80a5803508cf' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'sherzodsherzodov-kf3km', 'Orqendeylar itarman sikib oldira mn', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5fd8e6b0-e329-5a1e-a50b-80a5803508cf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('816b1fd3-1ffb-5258-a9ea-515e7cc87d48' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'NadiayesabetMorenovalladar-t1o', 'Yo 2026', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('816b1fd3-1ffb-5258-a9ea-515e7cc87d48' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6bcc3636-7a08-558b-a8c6-6ae30d7e8392' AS UUID), CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID), NULL, 'RogerAguayo-d8l', 'Alguien en 2026 🎧', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6bcc3636-7a08-558b-a8c6-6ae30d7e8392' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a6fa303f-94c0-5976-9918-cf254959d311' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('db7951bc-c50c-535f-bed5-0d9169bda921' AS UUID), 'seed-channel:db7951bc-c50c-535f-bed5-0d9169bda921', 'db7951bc-c50c-535f-bed5-0d9169bda921@catalog.invalid', 'Chynoy Nacho', CAST('2016-04-20T07:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2016-04-20T07:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('db7951bc-c50c-535f-bed5-0d9169bda921' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), 'Chino y Nacho - Andas En Mi Cabeza ft. Daddy Yankee', 'Music video by Chino y Nacho performing Andas En Mi Cabeza. (C) 2016 Machete Music

http://vevo.ly/0daGG3', 28, '/media/582e2db8-32f7-5217-824b-6ec9ba3536bc/thumbnail.webp', '/media/582e2db8-32f7-5217-824b-6ec9ba3536bc/video.mp4', CAST('db7951bc-c50c-535f-bed5-0d9169bda921' AS UUID), 1976761682, 5268196, CAST('2016-04-20T07:00:01.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5d1a3c83-852d-54d5-bd19-bc2bb0d3a4f1' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'rashedrafat1600', 'I heard it for the first time today .... it is very nice , very nice', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5d1a3c83-852d-54d5-bd19-bc2bb0d3a4f1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d347d5b2-b7b7-5a3f-a5a8-39fb69051b50' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'Gaelsiuu7ka-chow', '3:18 si tú te vas se muere el amor el que tú me das y llega el dolor seré un vagabundo solo este mundo', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d347d5b2-b7b7-5a3f-a5a8-39fb69051b50' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0c9fb4c4-af0e-58ca-838f-a3cdf274aa48' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'JosegregorioTorrealbaacevedo', '???donde están los mejores de mi país ??????'''''''' dondeeeeeeeeee por que dejaron de hacer esta realidad tan hermosa mi mejor epoca escuchar a los mas duros también los cadila uuuuf', NULL, CAST('2026-09-29T23:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0c9fb4c4-af0e-58ca-838f-a3cdf274aa48' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('de752eac-7d32-541d-aef9-0aa1106e6584' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'ESTERNORIEGA-x9j', '❤❤❤❤❤❤', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('de752eac-7d32-541d-aef9-0aa1106e6584' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b77bcc96-b3de-56c4-8c0f-9f12fdc7a17d' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'ParkerPC-l8u', 'Quien en Octubre del 2030?', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b77bcc96-b3de-56c4-8c0f-9f12fdc7a17d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9c60baba-adc2-5c7d-8075-b5de5f638938' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'FernandaAliciaCruzMorale1234', 'Me gustó mucho', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9c60baba-adc2-5c7d-8075-b5de5f638938' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3816050c-a3e3-54c7-a621-1afb7bcb8703' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'NahuelAvila-l7q', 'O', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3816050c-a3e3-54c7-a621-1afb7bcb8703' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('dc6c356d-c0ee-5c32-bb2c-9f1e9fc8ab3f' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'verdyplaying1826', 'Las canciones más buenas de antes🥹', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('dc6c356d-c0ee-5c32-bb2c-9f1e9fc8ab3f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d46eedbd-8fab-521f-94cc-ade18d6e50b4' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'WpnAvhsm', 'Wow Im Hasem.', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d46eedbd-8fab-521f-94cc-ade18d6e50b4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8aef536c-898c-5edf-aa53-9faf6251e2d2' AS UUID), CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID), NULL, 'GianeSantosdemeireles', 'Top está música', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8aef536c-898c-5edf-aa53-9faf6251e2d2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('582e2db8-32f7-5217-824b-6ec9ba3536bc' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('8ef27096-9881-575c-b45b-b03d1f024999' AS UUID), 'seed-channel:8ef27096-9881-575c-b45b-b03d1f024999', '8ef27096-9881-575c-b45b-b03d1f024999@catalog.invalid', 'Selena Gomez', CAST('2022-09-07T16:00:09.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2022-09-07T16:00:09.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('8ef27096-9881-575c-b45b-b03d1f024999' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('42a21a2b-f340-5ca7-a2e5-7e5f03a422bf' AS UUID), 'Rema, Selena Gomez - Calm Down (Official Music Video)', 'Listen to “Calm Down” with Rema: https://selenagomez.lnk.to/CalmDown

Listen to the new album ''I Said I Love You First'', out now: https://sgxbb.lnk.to/ISaidILoveYouFirst

Shop new merch: https://selenagomez.lnk.to/store 
Join Selena’s mailing list: https://selenagomez.lnk.to/SignUp

Follow Selena Gomez: 
Instagram: https://selenagomez.lnk.to/Instagram
Twitter: https://selenagomez.lnk.to/Twitter
Facebook: https://selenagomez.lnk.to/Facebook
TikTok: https://selenagomez.lnk.to/TikTok
YouTube: https://selenagomez.lnk.to/YouTube

Follow Rema: 
Instagram: https://www.instagram.com/heisrema/
Twitter: https://x.com/heisrema
Facebook: https://www.facebook.com/heisrema/
TikTok: https://www.tiktok.com/@badboyrema
YouTube: https://www.youtube.com/@heisrema

Music video by Rema, Selena Gomez performing Calm Down.© 2022 Mavin Global Holdings Ltd / Jonzing World Entertainment, under exclusive license to Interscope Records

#SelenaGomez #Rema #CalmDown', 32, '/media/42a21a2b-f340-5ca7-a2e5-7e5f03a422bf/thumbnail.webp', '/media/42a21a2b-f340-5ca7-a2e5-7e5f03a422bf/video.mp4', CAST('8ef27096-9881-575c-b45b-b03d1f024999' AS UUID), 1483329762, 10026154, CAST('2022-09-07T16:00:09.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('42a21a2b-f340-5ca7-a2e5-7e5f03a422bf' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('42a21a2b-f340-5ca7-a2e5-7e5f03a422bf' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('42a21a2b-f340-5ca7-a2e5-7e5f03a422bf' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('42a21a2b-f340-5ca7-a2e5-7e5f03a422bf' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1bc0dab9-a9d2-5524-a33c-b12699ba9ebb' AS UUID), CAST('42a21a2b-f340-5ca7-a2e5-7e5f03a422bf' AS UUID), NULL, 'Shabaz88j', '2022 Vibes✨', NULL, CAST('2026-09-30T10:45:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1bc0dab9-a9d2-5524-a33c-b12699ba9ebb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('42a21a2b-f340-5ca7-a2e5-7e5f03a422bf' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), 'The Emptiness Machine (Official Music Video) - Linkin Park', 'New film UNSHATTER in theaters worldwide September 30. 
Get tickets and info: http://unshattermovie.com

From Zero (Deluxe Edition) - Out Now: https://lprk.co/fromzerodlx

Follow Linkin Park: 
Tour Dates: http://lprk.co/tour
Official Linkin Park Merch: http://lprk.co/store
Newsletter Sign Up: https://lprk.co/newsletter
Text Us: https://lprk.co/text
YouTube Subscribe: http://lprk.co/youtube
Facebook: http://lprk.co/facebook
Instagram: http://lprk.co/instagram
TikTok: http://lprk.co/tiktok
Twitter: http://lprk.co/twitter
Discord: https://discord.gg/linkinpark

Credits:
Director: Joe Hahn
Producer: W.L. Boyd
Production Company: Swartz/Boyd Productions
Production Supervisor: Danny Gomez
1st AD: Julian Metter, Chris Gonzales
2nd AD: Chris Gonzales, John Evangelista
DP: Adam Evans
Cam Op B Unit: Eduardo Capriles
Cam Op B Unit: Pat Notaro
AC: Blake Collins, Maya Hernandez
Gaffer: Zacharia Dalton
Key Grip: Carlton Hudson, Chris Bond
Swing: Nick Lombardo, Josh Gordon, Chris Waldorf
Production Designer: Robert Fox
Props: Armando Nunez
Art Asst: Jeff Myron
Playback: Tim Hays, Ryan Canestro
Wardrobe Stylist: Mark Holmes
Asst. Wardrobe: Ray Avalos
Asst. Wardrobe: Meesh Daranyi
Hair/MU (Emily): Carolina Ballesteros
Hair/MU (Band): Dusty Starks, Emily Zempel
PA: Alexis Espadas, William Jacobus, Danielle Rivera
Extras: Adam Casillas, Adam Ruehmer, Lorenzo Errico

Editor: Igor Kovalik
Asst. Editor: Gabriel Ordonez

Post FX:
Lead VFX and Design by cntrl.studio
Jeff Lichtfuss - Project Creative Director / VFX Supervisor
Michaela McKee - Executive Producer
Max Drenckpohl - Colorist
Theo Tagholm - Motion Designer
Benny Vargas - CG Character Rigger / 3D Modeler
Fernando Fasano - Assoc. VFX Producer
Particle FX CGI by Bleed VFX
CGI Executive Producer: Lisa Maffi
CGI Director: Paolo Cavalieri
CGI Producers: Belen Cisneros, Virginia Palacios
CGI Supervisor & TD: Nicolas Zabala
CGI Artists: Marcos Montane, Martin Peralta
Dario Saquetti, Nicolas Zabala, Paolo Cavalieri

Markerless Motion Capture and Animation done using Wonder Studio
by Wonder Dynamics (an Autodesk Company)
Nikola Todorovic

Nebojsa Nesic - Pipeline TD
Maksim Ljubenkovic - VFX TD
Katarina Stojkovic - VFX Production Manager
Nikoleta Nikolic - Machine Learning Pipeline Engineer
Evgenije Markovic - Animator
Ivana Jevtic - Animator
Ana Bogdanovic - Animator
Nikola Milinkovic - Animator
Ines Vujkovac – Machine Learning Engineer
Mark Sturley – Witness Camera Operator
Nikki Flores – Production Asst.

Video Commissioner: Devin Sarno / Warner Records


#LinkinPark #FromZero #TheEmptinessMachine', 33, '/media/3220a334-eb41-525a-9a29-e0ada8001efb/thumbnail.webp', '/media/3220a334-eb41-525a-9a29-e0ada8001efb/video.mp4', CAST('17c266b7-7d8f-59e0-bc88-eb23950a71b5' AS UUID), 229167054, 2560818, CAST('2024-09-05T23:15:08.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b7f6b613-7646-5a89-9a23-c255c2d61553' AS UUID), CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), NULL, 'febryansyahputra1785', '🔥🔥🔥', NULL, CAST('2026-09-30T10:24:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b7f6b613-7646-5a89-9a23-c255c2d61553' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cce096b3-4fcc-561b-bd0a-d81476d05d05' AS UUID), CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), NULL, 'sabrinachen5191', 'so mediocre', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cce096b3-4fcc-561b-bd0a-d81476d05d05' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c216ae17-d3af-5bb5-817a-db79a302351a' AS UUID), CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), NULL, 'ungkanaThountham', '❤ I’ve been a fan of your music for a very long time, but I never really followed your work on social media. Nong Nene was the one who led me to discover you and start following you. 🤍', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c216ae17-d3af-5bb5-817a-db79a302351a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4fdd4c67-37f4-531c-91e6-0ec9c6d19e19' AS UUID), CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), NULL, 'ksiriN-315', 'Thanks Linkin Park for the opportunity given to Nene. Such a heartwarming embrace from the legendary rock band. The performance was so amazing.', NULL, CAST('2026-09-30T10:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4fdd4c67-37f4-531c-91e6-0ec9c6d19e19' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cfb20992-ba40-5013-8e63-502a32e11811' AS UUID), CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), NULL, 'devellestewart2037', 'Nene royal went from nervous Shy girl into the Megastar and Rockstar!! That was so incredible performance by Nene royal , She really about to make a name for herself to the world and she Deserves it- Congratulations to Nana royal', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cfb20992-ba40-5013-8e63-502a32e11811' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('dea3a00c-4e59-5f40-84f8-223323c638d7' AS UUID), CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), NULL, '36002177', 'ร้องได้มันสะใจมาก', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('dea3a00c-4e59-5f40-84f8-223323c638d7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('931b00b7-ffef-58f1-b9f7-d1ffb1b6f649' AS UUID), CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID), NULL, 'rad39tyo', 'I''m really crying for listening this song. LP is so amazing.', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('931b00b7-ffef-58f1-b9f7-d1ffb1b6f649' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('3220a334-eb41-525a-9a29-e0ada8001efb' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('d830a928-9a3f-58fa-a0a6-0b010432e18d' AS UUID), 'seed-channel:d830a928-9a3f-58fa-a0a6-0b010432e18d', 'd830a928-9a3f-58fa-a0a6-0b010432e18d@catalog.invalid', 'Rage Against the Machine', CAST('2011-03-27T02:21:12.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2011-03-27T02:21:12.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('d830a928-9a3f-58fa-a0a6-0b010432e18d' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), 'Rage Against The Machine - Killing In the Name (Official HD Video)', 'Official HD music video for "Killing In the Name" by Rage Against the Machine
Listen to RATM: https://rageatm.lnk.to/listenYD 
Watch more videos by Rage Against the Machine: https://rageatm.lnk.to/listenYD/youtube 

Subscribe to the official RATM YouTube channel: https://rageatm.lnk.to/subscribeYD

Follow RATM: 
Facebook: https://rageatm.lnk.to/followFI 
Instagram: https://rageatm.lnk.to/followII 
Website: https://rageatm.lnk.to/followWI 
Spotify: https://rageatm.lnk.to/followSI

Lyrics:
[Intro]
Killing in the name of

[Verse]
Some of those that work forces
Are the same that burn crosses
Some of those that work forces
Are the same that burn crosses
Some of those that work forces
Are the same that burn crosses
Some of those that work forces
Are the same that burn crosses
Uh!

[Refrain]
Killing in the name of
Killing in the name of

[Pre-Chorus]
Now you do what they told ya
Now you do what they told ya
Now you do what they told ya
Now you do what they told ya
And now you do what they told ya
And now you do what they told ya
And now you do what they told ya
And now you do what they told ya
And now you do what they told ya
And now you do what they told ya
But now you do what they told ya!
Well, now you do what they told ya

[Chorus]
Those who died are justified
For wearing the badge, they''re the chosen whites
You justify those that died
By wearing the badge, they''re the chosen whites
Those who died are justified
For wearing the badge, they''re the chosen whites
You justify those that died
By wearing the badge, they''re the chosen whites

[Verse]
Some of those that work forces
Are the same that burn crosses
Some of those that work forces
Are the same that burn crosses
Some of those that work forces
Are the same that burn crosses
Some of those that work forces
Are the same that burn crosses
Uh!

[Refrain]
Killing in the name of
Killing in the name of

[Pre-Chorus]
Now you do what they told ya
Now you do what they told ya
Now you do what they told ya
Now you do what they told ya
And now you do what they told ya
(Now you''re under control) And now you do what they told ya
(Now you''re under control) And now you do what they told ya
(Now you''re under control) And now you do what they told ya
(Now you''re under control) And now you do what they told ya
(Now you''re under control) And now you do what they told ya
(Now you''re under control) And now you do what they told ya
(Now you''re under control) And now you do what they told ya

[Chorus]
Those who died are justified
For wearing the badge, they''re the chosen whites
You justify those that died
By wearing the badge, they''re the chosen whites
Those who died are justified
For wearing the badge, they''re the chosen whites
You justify those that died
By wearing the badge, they''re the chosen whites
Come on!

[Guitar Solo]
Ugh!
Yeah!
Come on!
Ugh!

[Outro]
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Fuck you, I won''t do what you tell me
Motherfucker!
Ugh!

#KillingInTheName #RATM #RageAgainstTheMachine #HD #Remastered', 37, '/media/6a57deb4-a307-5ffd-a002-80c0fedc31bb/thumbnail.webp', '/media/6a57deb4-a307-5ffd-a002-80c0fedc31bb/video.mp4', CAST('d830a928-9a3f-58fa-a0a6-0b010432e18d' AS UUID), 361091911, 2340418, CAST('2011-03-27T02:21:12.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b732de07-98b5-58a0-b27d-9226c6d42b12' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'RichardStar-g7z', 'DONALD TRUMP GET PAID AND SEND THEM HOME WITH RESPECT. THERE IS WIGGLE ROOM OF WHY', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b732de07-98b5-58a0-b27d-9226c6d42b12' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1d0ce0b4-b8ff-53e5-9265-ae2d011dff05' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'RichardStar-g7z', 'GHOST CREW PACK UP WE GOING HOME FOR Christmas. ❤❤❤❤❤❤❤❤', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1d0ce0b4-b8ff-53e5-9265-ae2d011dff05' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e6833f89-30db-525d-b3bf-b8c1f5c69be7' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'renaemaguire1093', 'GLORIA SAINTS 🤍
GLORIA HOLY CATHOLIC CHURCH 💒
GLORIA FATHER 😇
💯', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e6833f89-30db-525d-b3bf-b8c1f5c69be7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('16a4cc3d-bd91-5e90-b92d-5be4f54aaac1' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'valarkana2184', 'Timeless. ❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥❤️‍🔥💖💖💖💖💖💝💝💝💝💝💝💝💝💫👊🙏🖕🖕🖕🖕🖕🖕🖕💪💪💪💪💪🫶🫶🫶🫶🫶🫶🫶🫶🫶🫶', NULL, CAST('2026-09-29T22:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('16a4cc3d-bd91-5e90-b92d-5be4f54aaac1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('af4265eb-f135-5859-82f6-1df01c39a05a' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'user-t1x7c', 'What a time it was💣💣💣❤', NULL, CAST('2026-09-29T17:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('af4265eb-f135-5859-82f6-1df01c39a05a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('70e8b54b-f86f-5b73-9b99-c307a75234d1' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'bhgamingstudios4180', 'Everyone thought this was just entertainment, when the message was real.', NULL, CAST('2026-09-29T16:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('70e8b54b-f86f-5b73-9b99-c307a75234d1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b35c6382-76f7-5941-93fa-4570ea0256e3' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'diegoadrianbellidosalvatierra', 'Mi amigo el rockero heavy metal que cree haberlo escuchado todo y yo poniendole todo el volumen al maximo para que vea que recien esta gateando en el camino del Rock..', NULL, CAST('2026-09-29T15:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b35c6382-76f7-5941-93fa-4570ea0256e3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('189070fd-7e74-5635-94f5-a16ed4e312e2' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'melwen4932', 'start playing it again! ✊🖤❤', NULL, CAST('2026-09-29T15:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('189070fd-7e74-5635-94f5-a16ed4e312e2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7b0067f9-2d6d-5691-abc5-915a61fa839f' AS UUID), CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID), NULL, 'GavinAinsworth-k5d', 'This song is awesome', NULL, CAST('2026-09-29T15:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7b0067f9-2d6d-5691-abc5-915a61fa839f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6a57deb4-a307-5ffd-a002-80c0fedc31bb' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('d2830bb5-fd40-52c1-a23c-0ef4712e70c1' AS UUID), 'seed-channel:d2830bb5-fd40-52c1-a23c-0ef4712e70c1', 'd2830bb5-fd40-52c1-a23c-0ef4712e70c1@catalog.invalid', 'twenty one pilots', CAST('2025-09-12T04:00:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2025-09-12T04:00:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('d2830bb5-fd40-52c1-a23c-0ef4712e70c1' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), 'Twenty One Pilots - City Walls (Official Video)', 'Official video for “City Walls” from the album Breach, available now. 

Stream / Download Breach: https://top.lnk.to/breach
Stream "City Walls”:  https://top.lnk.to/breach

LYRICS
Square up with me, I can take your right, throw a left,
Pair up with me, I’mma take you right to the chest,
Warpath etched in the surface,
Lines of the yellow tape, they’re moving quiet like a,
Serpentine in a formation,
Buddy, that''s my team, pretty impatient,
Now they’re waiting on me,
It might be the furthest we’ve reached,
Now move it up, move it up, it''s a breach.
 
I wonder where you are,
I wanted to you to show me,
The way around those city walls,
The way on through,
I wonder where you are,
I wanted you to show me,
But now the night has fallen,
Abandoned by the sun.
 
Square up with me, I can come to you, tell me when,
Pair up with me, I can run on you, in the end,
I write a promise in pencil but my loyalty’s in pen,
Use a mistake as a crooked stencil,
Then we trace it back again,
From the mainland to the island of violence,
It was the same plan for a while, decided,
To send me up and rip you out of your seat,
You see, in a city with no entrance there is not a retreat,
I’m wondering what you thought would happen,
Who you thought I would be,
Was this a side-swipe or did you picture this in a dream?
Buckle down, this is possibly the furthest we’ve reached,
Now move it up, move it up, it''s a breach.
 
My smile wraps around my head splitting it in two,
I don’t have a clue how I can keep the top half glued.
 
Entertain my faith,
This is the last time that I try.
Address my soul,
Entertain my faith,
This is the last time that I try.

Subscribe for more official content from Twenty One Pilots: https://top.lnk.to/subscribe  
Site: https://TOP.lnk.to/website 
Store: https://TOP.lnk.to/store 
Spotify: https://TOP.lnk.to/spotify 
Apple Music: https://TOP.lnk.to/apple 
Amazon Music: https://TOP.lnk.to/amazon 
Instagram: https://TOP.lnk.to/instagram 
Twitter: https://TOP.lnk.to/twitter 
Facebook: https://TOP.lnk.to/facebook 
TikTok: https://TOP.lnk.to/tiktok 
YouTube: https://TOP.lnk.to/youtube

#TwentyOnePilots #Breach #CityWalls', 29, '/media/8a703457-56d8-5b78-aa1f-4e2273c442e7/thumbnail.webp', '/media/8a703457-56d8-5b78-aa1f-4e2273c442e7/video.mp4', CAST('d2830bb5-fd40-52c1-a23c-0ef4712e70c1' AS UUID), 21488858, 289768, CAST('2025-09-12T04:00:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('35ca612d-48de-580a-b6a2-5fefbbb130d5' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'Xørtney', 'The best revenge is not to be like your enemy. ❤
-Marcus Aurelius, Meditations

Think of yourself as dead. 🪦 You have lived your life. Now, take what''s left and live it properly. What doesn''t transmit light creates its own darkness.
-Marcus Aurelius, Meditations

Very little is needed to make a happy life; it is all within yourself in your way of thinking.
-Marcus Aurelius, Meditations', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('35ca612d-48de-580a-b6a2-5fefbbb130d5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5b2b0a03-df2c-52e7-8bd1-1e21d2cbb0be' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'isaacisaac-o3j', 'The cray people in Seattle will come after you please help', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5b2b0a03-df2c-52e7-8bd1-1e21d2cbb0be' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('39022fe7-e8aa-507f-a5b0-04eecdef4610' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'isaacisaac-o3j', 'I’ve overdose on Benadryl and Seattle has crazy people everywhere', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('39022fe7-e8aa-507f-a5b0-04eecdef4610' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('414b7121-5b91-5315-87a5-835dd62847b2' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'isaacisaac-o3j', 'I’ve seen my spit move by it’s self help', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('414b7121-5b91-5315-87a5-835dd62847b2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d125d3d2-904e-5a5c-9635-f3fb309f3a9c' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'domagojsestak8650', 'SAHLOOOOO FOLINAAAAAAA', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d125d3d2-904e-5a5c-9635-f3fb309f3a9c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7ab2789b-37da-5ab1-aa03-59e2247fcb9a' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'domagojsestak8650', 'SAHLOOOOOO FOLINAAAAAAA', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7ab2789b-37da-5ab1-aa03-59e2247fcb9a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4fbc3d65-77d4-5a2b-9be4-fa541c71856a' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'domagojsestak8650', 'SAHLOOOOO FOLINAAAAAA', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4fbc3d65-77d4-5a2b-9be4-fa541c71856a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('309e0378-0c0c-5c86-86cc-479fdfa295b2' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'domagojsestak8650', 'SAHLOOOOOOOO FOLINAAAAAAA', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('309e0378-0c0c-5c86-86cc-479fdfa295b2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b1df3ee6-d04c-59c6-a35a-7f74fb8460c4' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'justinpatrick7899', 'One year later, & it''s still the best mv ever imo. Still gets me emotional each time I watch it. Everyone putting up the logo/symbol at the live shows was beautiful. Tyler turning towards BF/Nico multiple times to face him & using the symbol & them adding the "and you" gets me emotional each time I watch this.', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b1df3ee6-d04c-59c6-a35a-7f74fb8460c4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f0cf78ec-6372-5809-b41d-4d61506cab00' AS UUID), CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID), NULL, 'Xørtney', 'Whoever has no rule over his own spirit is like a city broken down, without walls

So perhaps the presence of walls may not be all that bad, DEMA could benefit from a new head of leadership, back in control no more shotty…
📴Autopilot
✅Manual control ON
Guess who’s back in control of DEMA?? On the surface it looks gloomy but perhaps it’s progress… “move it up move it up… this is the furthest/highest we’ve reached”… SO FAR… continue to soar!!

Challenge your perspective!!', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f0cf78ec-6372-5809-b41d-4d61506cab00' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8a703457-56d8-5b78-aa1f-4e2273c442e7' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('9180544a-d068-53ea-8500-a7ee80a3e680' AS UUID), 'seed-channel:9180544a-d068-53ea-8500-a7ee80a3e680', '9180544a-d068-53ea-8500-a7ee80a3e680@catalog.invalid', 'Sopa de Cabra', CAST('2021-05-10T06:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2021-05-10T06:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('9180544a-d068-53ea-8500-a7ee80a3e680' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID), 'SOPA DE CABRA - Si et quedes amb mi - 30 anys', 'Videoclip oficial de "Si et quedes amb mi" 30 anys. Ja disponible a totes les plataformes: https://orcd.co/sietquedesambmi30anys

Subscriu-te al canal de Sopa de Cabra aquí per estar al dia de totes les novetats: https://orcd.co/sopadecabrayt

Segueix-nos a: Facebook: https://www.facebook.com/Sopadecabrao...
Instagram: https://www.instagram.com/sopa_decabra/
Twitter: https://twitter.com/sopadecabra
Web Oficial: https://sopadecabra.cat/

Més lluny de les muntanyes
Jo vull trobar un racó
Per viure sense pressa
I ser l''ombra del teu cos
Si et quedes, aah, si et quedes amb mi
No et puc donar riquesa
No puc donar-t''ho tot
Puc ser el teu llarg viatge
Puc ser la llum del sol
Si et quedes, aah, si et quedes amb mi
Quan estiguis cansada
Jo et dinaré repós
Quan res no vulguis veure
T''ompliré els ulls de flors
De dia quan despertis
Vull estar al teu cantó
Vull tenir les mans buides
Per prendre el teu amor
Quan se''t tanquin les portes
Jo t''obriré el balcó
Quan creguis que estàs sola
Podràs cridar el meu nom
Si et quedes, aah, si et quedes amb mi
No vull guanyar cap guerra
No vull ser el teu heroi
No vull fer cap promesa
No vull entendre el món
Despinta les banderes
I fes-ne un gran llençol
Per sobre les fronteres
Podràs sentir-me a prop
Més lluny de les muntanyes
Hi haurà d''haver algun lloc
Per viure sense pressa
I ser l''ombra del teu cos
Si et quedes, aah, si et quedes, ah amb mi
Si et quedes amb mi, si et quedes amb mi, si et quedes amb mi


2021 Promo Arts Music Records

#sopadecabra #sietquedesambmi30anys #sietquedesambmi #benendins #30anysbenendins

sopa de cabra, sopa de cabra 2021, sopa de cabra videoclip, sopa de cabra nou video, sopa de cabra si et quedes amb mi, ben endins, si et quedes amb mi 30 anys, 30 anys ben endins, si et quedes amb mi, si et quedes amb mi video, rock, rock catala, rock catala 2021, sopa de cabra l''emporda, sopa de cabra camins, sopa de cabra els teus somnis', 21, '/media/07565116-d455-5d63-9f3d-a5e4d6455d4f/thumbnail.webp', '/media/07565116-d455-5d63-9f3d-a5e4d6455d4f/video.mp4', CAST('9180544a-d068-53ea-8500-a7ee80a3e680' AS UUID), 1400185, 7200, CAST('2021-05-10T06:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1563a495-73a1-589d-9fab-f0f263c119be' AS UUID), CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID), NULL, 'dinansemitere6246', 'Esa canción me encanta es brutal y espero algún día veros en directo en Lleida', NULL, CAST('2026-09-23T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1563a495-73a1-589d-9fab-f0f263c119be' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2fe94076-5e4c-5406-b940-5cd4c6ca0fbc' AS UUID), CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID), NULL, 'montse7036', 'quina cançó tan ben parida! ❤', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2fe94076-5e4c-5406-b940-5cd4c6ca0fbc' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8d8d00f8-0a95-572e-a2cf-abb44a285c14' AS UUID), CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID), NULL, 'Brujita-ab2', 'Desde Euskadi
...me encantaa❤', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8d8d00f8-0a95-572e-a2cf-abb44a285c14' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('738bfc32-ceda-568c-b0e2-8457f48eea0b' AS UUID), CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID), NULL, 'nico72glez47', 'Hola. ¿Podrían decirme cómo se llama la primera y segunda chica que cantan?. Muchas gracias y temazo eterno.', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('738bfc32-ceda-568c-b0e2-8457f48eea0b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ee60ad82-f5f8-5609-86c4-f311a4533291' AS UUID), CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID), NULL, 'PaulaMolla-t6f4h', 'Una de les cançons de la leva joventut❤ bons récords d'' aquella época i del rock Catalá ❤ sou unics❤', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ee60ad82-f5f8-5609-86c4-f311a4533291' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('07565116-d455-5d63-9f3d-a5e4d6455d4f' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), 'Sopa de cabra - El boig de la ciutat (30 anys) feat. Alvaro Soler, Alfred García i Ramon Mirabet', 'Videoclip oficial de "El boig de la ciutat" 30 anys de Sopa de Cabra feat. Alvaro Soler, Alfred García i Ramon Mirabet. Ja disponible a totes les plataformes: https://orcd.co/elboigdelaciutat30anys

Subscriu-te al canal de Sopa de Cabra aquí per estar al dia de totes les novetats: https://orcd.co/sopadecabrayt

Segueix-nos a: Facebook: https://www.facebook.com/Sopadecabraoficial
Instagram: https://www.instagram.com/sopa_decabra/
Twitter: https://twitter.com/sopadecabra
Web Oficial: https://sopadecabra.cat/

LLETRA
Acabava d''arribar
només volia tranquillitat
després de nits humides a la carretera.
Ell se''m va posar a davant
no em vaig saber controlar,
va caure en mig d''una bassa de sang
i em va dir:
Jo era el boig de la ciutat,
tu m''has matat,
m''hauràs de substituir d''ara endavant
Van acceptar la condemna
per majoria absoluta
ni tan sols vaig poder-me defensar.
"Vagaràs fins l''ultim dia
també de nit per tota la vila,
tu ets l''elegit per tots", em van dir:
Tu ets el boig de la ciutat, tu l''has matat,
l''hauràs de substituir d''ara endavant.
Vaig passant dies i dies,
aguantant humiliacions,
l''odi no te força quan s''està sol.
Cauré dins d''aquest forat
del que no puc escapar,
em fa cantar per suportar el dolor.
Sóc el boig de la ciutat,
jo el vaig matar,
l''hauré de substituir fins que algú acabi amb mi,
fins que algú, algú, algú acabi amb mi"

2021 Promo Arts Music Records

#sopadecabra #elboigdelaciutat', 28, '/media/137848ad-eed1-5da4-b42e-7848d8239b2a/thumbnail.webp', '/media/137848ad-eed1-5da4-b42e-7848d8239b2a/video.mp4', CAST('9180544a-d068-53ea-8500-a7ee80a3e680' AS UUID), 650540, 3161, CAST('2021-11-18T23:00:03.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('264a193b-2387-5471-ba3f-cdbd55b303a3' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'lukaskakagarxiaa776', 'hora de borrarla', NULL, CAST('2026-04-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('264a193b-2387-5471-ba3f-cdbd55b303a3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d9399bda-0201-5cfd-93d8-47504b435231' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'cristinariverorivero6179', 'Preciosa !', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d9399bda-0201-5cfd-93d8-47504b435231' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('de0f760b-af3d-561b-97ac-c053ddb09121' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'futboltecatv', 'Gràcies Sopa per aquesta versió, m''agrada tant la original com aquesta.', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('de0f760b-af3d-561b-97ac-c053ddb09121' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5b1067dc-295c-55a8-9cd5-da40726e8082' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'maserasgimenoj', 'Pels depres siempre ens queda......txarango😢', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5b1067dc-295c-55a8-9cd5-da40726e8082' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4dfebf6c-af37-5c8e-866f-b960a0fff2b9' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'JESUSLIVE99', '❤❤❤❤❤ me encantaaa', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4dfebf6c-af37-5c8e-866f-b960a0fff2b9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f9eb3a53-ddd9-502f-b230-7562bf08d230' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'Jordiforcadamatheu', 'el xivo expiatorio de les families narcisistes. chapo!!!!!!! gerard, eso es asi', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f9eb3a53-ddd9-502f-b230-7562bf08d230' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ea4da527-b651-59bb-962f-9efcd8ffe102' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'MargaritaAbelloGil', '🌍', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ea4da527-b651-59bb-962f-9efcd8ffe102' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8ed4c7ea-1303-5a7c-9d57-2184afdbfea7' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'ROSERINVERNOCOSTA', 'Anims nois', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8ed4c7ea-1303-5a7c-9d57-2184afdbfea7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6839b813-01d9-5f85-b04a-31b06a422fb3' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'ROSERINVERNOCOSTA', 'Canto jo i las muntanyas ballaran', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6839b813-01d9-5f85-b04a-31b06a422fb3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('88bd13ab-4adc-5867-9a49-ac30d5c3425c' AS UUID), CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID), NULL, 'josepmariainfantes8008', 'Preciosa, preciosa. Sou genials. Gràcies!', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('88bd13ab-4adc-5867-9a49-ac30d5c3425c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('137848ad-eed1-5da4-b42e-7848d8239b2a' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('e00213f9-7341-5abe-abfb-058e087129f7' AS UUID), 'seed-channel:e00213f9-7341-5abe-abfb-058e087129f7', 'e00213f9-7341-5abe-abfb-058e087129f7@catalog.invalid', 'Decora Conmigo', CAST('2024-06-25T20:27:42.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2024-06-25T20:27:42.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('e00213f9-7341-5abe-abfb-058e087129f7' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID), '⭐ Sorprendentes DIY para DECORAR sin gastar 💓IDEAS simples y ELEGANTES que querrás hacer/ Decoración', 'Bienvenidos a DECORA CONMIGO. No olvides SUSCRIBIRTE y COMPARTIR este video 😊
Hoy les compartiré DIYS fáciles y económicos. Espero lo disfruten. 🏘️ 🪴

REDES SOCIALES 💖
🌸 FACEBOOK: https://www.facebook.com/profile.php?id=100065527843380
🌸 INSTAGRAM: https://www.instagram.com/decora_conmigo0/


📧 Correo electrónico:(Negocios, Business)decoraconmigocolaboraciones@gmail.com


LISTA DE REPRODUCCIÓN DIYS
https://youtube.com/playlist?list=PLG8snne5Y_od9VmkoEJnImr8RwlO6H-cI































































































MANUALIDADES, DECORACION, LIMPIEZA, ORGANIZACIÓN,  ideas para decorar, decoraciones 2021,decoracion de la sala de estar, decoracion del comedor, decoracion de la cocina, como hacer jarrones,como hacer candelabros, DIY, transformacion de la sala, transformacion y decoración, ideas para la cocina, ideas para decorar tu casa, manualidades fáciles, decoraciones elegantes, como hacer decoraciones elegantes, limpieza de la casa, videos de organización, videos de limpieza, habitos de limpieza, decora conmigo, haul dollar city, haul elegantes, haul economio, haul para decorar, haul para el hogar, haul baratos, decorando conmigo youtube, decorando conmigo0, decoración escandinava, decoración escandinavo, decoración minimalista, decoración industrial, decoración shabby chic, decoración farmhouse,  decoración minimalista, decoración nordica, decoración glam, decoración casa pequeña, las mejores ideas para decorar tu hogar, las mejores ideas para decorar tu oficina, las mejores ideas para decorar tu casa, las mejores ideas para decorar tu casa pequeña, las mejores ideas para decorar económico, las mejores ideas para decorar tu sala, las mejores ideas para decorar tu baño, las mejores ideas para decorar tu habitación, decoración low cost , diy facil y economico ,manualidades nordicas, bandejas decorativas , decoracion boho.', 20, '/media/553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e/thumbnail.webp', '/media/553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e/video.mp4', CAST('e00213f9-7341-5abe-abfb-058e087129f7' AS UUID), 43199, 2023, CAST('2024-06-25T20:27:42.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID), 'PEOPLE_AND_BLOGS'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID) AND category = 'PEOPLE_AND_BLOGS') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('35ba3a6c-a4c6-51a6-906d-9fb421bb801e' AS UUID), CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID), NULL, 'ellagh', 'De verdad que eres increíble, poderosa y maravillosa Lunita, gracias por brindarnos tus hermosas creaciones. Me gustó todo lo que hiciste. Saludos y bendiciones para ti y tus seguidores 🥰🌹', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 8
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('35ba3a6c-a4c6-51a6-906d-9fb421bb801e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e4655a49-c839-5219-bb27-59d349f76c6d' AS UUID), CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID), NULL, 'Decora_Conmigo', 'Hola 😊 aaawww que linda eres gracias por tu lindo comentario que me hace muy feliz 🥰 Te envío un fuerte abrazo con mucho cariño 🤗 hasta la próxima.', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e4655a49-c839-5219-bb27-59d349f76c6d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('553e6c6f-5aa9-5357-80c1-7d7e4c6bd65e' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('d559e9e2-f66d-541e-b9d1-53fb4e0ddcaf' AS UUID), 'seed-channel:d559e9e2-f66d-541e-b9d1-53fb4e0ddcaf', 'd559e9e2-f66d-541e-b9d1-53fb4e0ddcaf@catalog.invalid', 'Blossom', CAST('2019-12-28T12:00:05.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2019-12-28T12:00:05.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('d559e9e2-f66d-541e-b9d1-53fb4e0ddcaf' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), '15 Clever Ways to Upcycle Everything Around You!! Recycling Life Hacks and DIY Crafts by Blossom', 'Why throw it away when you can fix it, upcyle it and reuse it? Here are our top 15 ways to upcycle everyday objects around you. For more recycling tricks, smart DIY projects, and thrifty life hacks subscribe to Blossom! 

How to upcycle & recycle by Blossom!!

Subscribe to Blossom: https://www.youtube.com/channel/UC2WuPTt0k8yDJpfenggOAVQ?sub_confirmation=1

About Blossom:
Welcome to your cheat sheet for creative and unique DIY projects, mixed with daily life fixes that keep you and your family in mind. Consider your life hacked! 

Follow us:
Facebook: http://bit.ly/BlossomFacebook
Instagram: http://bit.ly/BlossomInstagram
Website: http://bit.ly/BlossomFirstMedia

#Blossom #DIY #Hacks


https://www.youtube.com/channel/UC2WuPTt0k8yDJpfenggOAVQ How to, tutorial, #howto #tutorial #hacks', 25, '/media/6c8e4779-ee66-5cef-a8e2-c34b8f4e08af/thumbnail.webp', '/media/6c8e4779-ee66-5cef-a8e2-c34b8f4e08af/video.mp4', CAST('d559e9e2-f66d-541e-b9d1-53fb4e0ddcaf' AS UUID), 69791890, 400316, CAST('2019-12-28T12:00:05.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), 'HOWTO_AND_STYLE'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND category = 'HOWTO_AND_STYLE') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('af3e4131-9c46-5820-b62a-730d60aa4880' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'RiddleSparkX1', '😍😍😍😍😍😍', NULL, CAST('2026-09-18T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('af3e4131-9c46-5820-b62a-730d60aa4880' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('00587cce-8da6-5534-b59c-349e6f58c623' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'chinhchipubamottam7677', 'Excellent work, very informative!', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('00587cce-8da6-5534-b59c-349e6f58c623' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b622aa78-b770-588b-aed9-f4b0e57d0063' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'Inventormaster', 'Great and creative ideas—very useful for daily life.', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b622aa78-b770-588b-aed9-f4b0e57d0063' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0ce2534e-82d2-56c1-b2cf-cc3d7c900566' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'AlexAlcyone', 'plastic fumes, nice.', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0ce2534e-82d2-56c1-b2cf-cc3d7c900566' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4cf06055-6218-54e7-b794-998bc73667b8' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'HomemadeInventionLab', 'This was a great watch. What would you build differently next time?', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4cf06055-6218-54e7-b794-998bc73667b8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0ee2c294-2468-594d-81cf-4f55baecbb51' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'Utonish-l1k', 'December 28, 2018', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0ee2c294-2468-594d-81cf-4f55baecbb51' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a17a202e-2c89-5352-b70e-e8aae7c0e14f' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'Utonish-l1k', '7y', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a17a202e-2c89-5352-b70e-e8aae7c0e14f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8aff83e8-0ba8-5133-967c-c112feeb11ea' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'InventionLabShorts', 'Great project! What was your favorite part to build?', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8aff83e8-0ba8-5133-967c-c112feeb11ea' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('885ce1bf-0367-56f0-a0d8-5666d9df45e3' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'Catalanali-jq7js', 'Any one 2026 😢😢 i miss these og years of my life 😢', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('885ce1bf-0367-56f0-a0d8-5666d9df45e3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e44b9327-b56c-513d-88ad-b3f9da045b8a' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'MaryamSharife-i9b', 'چقدکاربردی بود', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e44b9327-b56c-513d-88ad-b3f9da045b8a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c12bf26d-c676-5fd7-bbfb-a4cf0fc24d7e' AS UUID), CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID), NULL, 'BimSua-s5n', 'Your creativity knows no limits.', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c12bf26d-c676-5fd7-bbfb-a4cf0fc24d7e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6c8e4779-ee66-5cef-a8e2-c34b8f4e08af' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), 'Taylor Swift - Blank Space', 'Music video by Taylor Swift performing Blank Space. (C) 2014 Taylor Swift.

Stream/download ‘The Life of a Showgirl’ - https://taylor.lnk.to/TSTheLifeofaShowgirlYD

►Shop Merch: http://taylor.lnk.to/store
►Subscribe to Taylor Swift on YouTube: https://ts.lnk.to/subscribe

►Follow Taylor Swift Online:
TikTok: http://tiktok.com/@taylorswift
Instagram: http://instagram.com/taylorswift
Twitter: http://twitter.com/taylorswift13
Snapchat: http://snapchat.com/add/taylorswift
Facebook: http://facebook.com/taylorswift
Tumblr: http://taylorswift.tumblr.com
Website: http://www.taylorswift.com

►Follow Taylor Nation Online:
TikTok: http://tiktok.com/@taylornation
Instagram: http://instagram.com/taylornation
YouTube: https://youtube.com/taylornation
Twitter: http://twitter.com/taylornation13
Tumblr: http://taylornation.tumblr.com

#TaylorSwift #BlankSpace', 22, '/media/57616d61-5ced-5434-88f1-3dd85b04b0d8/thumbnail.webp', '/media/57616d61-5ced-5434-88f1-3dd85b04b0d8/video.mp4', CAST('194ee690-0136-5a6f-9a26-94baa21c0b80' AS UUID), 3860401058, 16666357, CAST('2014-11-10T17:05:44.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1613d829-799c-5ecc-aa5a-72cf3a8d0c84' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'SphesihleMbatha-s8c', '2026 anyone ❤🎉', NULL, CAST('2026-09-30T10:17:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1613d829-799c-5ecc-aa5a-72cf3a8d0c84' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0473815c-1d5b-503d-ac9a-b336a77ce416' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'tifalockhart8641', 'Me rediscovering Taylor Swift videos after aa long time🎉🎉❤❤
Never gets old or boring.. 
❤❤🎉', NULL, CAST('2026-09-30T09:56:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0473815c-1d5b-503d-ac9a-b336a77ce416' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('79b40c21-3f76-5aba-af4e-580df8b31687' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'SonuSingh-t5z2u', 'Anyway 2026.....', NULL, CAST('2026-09-30T09:50:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('79b40c21-3f76-5aba-af4e-580df8b31687' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1ca0b54d-96a4-5b5b-b084-32dd0b7bb1e2' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'Nadasayosiko', 'I still love song ❤2026', NULL, CAST('2026-09-30T09:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1ca0b54d-96a4-5b5b-b084-32dd0b7bb1e2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('70a2eb50-abb4-570e-9bbd-559db8439b89' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'vickilyday4291', 'Such a brilliant song.', NULL, CAST('2026-09-30T07:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('70a2eb50-abb4-570e-9bbd-559db8439b89' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('46aac429-8006-56a4-9078-17316f598c5f' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'glutamin111', 'So from hindsight, what exactly was she trying to say with this song, im struggling to understand? Hardly insightful message for young people, no?', NULL, CAST('2026-09-30T06:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('46aac429-8006-56a4-9078-17316f598c5f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('889404fc-137c-5dd3-8c89-7c0b395f2207' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'cathymeowxd2183', '😊 maybe', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('889404fc-137c-5dd3-8c89-7c0b395f2207' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('91887779-52cd-5f4a-8d86-ad1aafa8823a' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'brparv', 'I''m still here after Patient Zero, both had the same vibe and mood.', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('91887779-52cd-5f4a-8d86-ad1aafa8823a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ae3ba1e9-1388-5b8c-9001-ac4ddcef3d19' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'PopHits-n1q', 'that final section was worth waiting for', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ae3ba1e9-1388-5b8c-9001-ac4ddcef3d19' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5982a498-83ad-53c7-99c3-37db461fa52b' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'TropicHits-c3k', 'Back in 2014, I would listen to this song most of the time. Old day ....', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5982a498-83ad-53c7-99c3-37db461fa52b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('383323d4-4602-5048-9794-de54f48f5b08' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'นู๋มุกหมวย', '🥰🥰🥰', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('383323d4-4602-5048-9794-de54f48f5b08' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1b446963-359e-51f0-9629-c62d7c34c356' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'whisper4517', 'Sean o pry', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1b446963-359e-51f0-9629-c62d7c34c356' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3c2f3e39-9d6a-5bb1-91f3-0829e65365e9' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'juanzavala9023', 'get along with starvicks lovers 🎶', NULL, CAST('2026-09-30T02:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3c2f3e39-9d6a-5bb1-91f3-0829e65365e9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1f39223c-4365-5dfb-8060-719ecf7c9337' AS UUID), CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID), NULL, 'Hokutonoken-k1c', 'Edited btw', NULL, CAST('2026-09-30T01:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1f39223c-4365-5dfb-8060-719ecf7c9337' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('57616d61-5ced-5434-88f1-3dd85b04b0d8' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('651b0392-28fa-5cc5-baca-cdb6f4699e6e' AS UUID), 'seed-channel:651b0392-28fa-5cc5-baca-cdb6f4699e6e', '651b0392-28fa-5cc5-baca-cdb6f4699e6e@catalog.invalid', 'Miguelito''sDIY', CAST('2022-06-15T11:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2022-06-15T11:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('651b0392-28fa-5cc5-baca-cdb6f4699e6e' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), '60 DIY HOME DECOR IDEAS + HACKS you Actually Want To MAKE (FULL TUTORIALS)', 'hola hola mis amores, para el video de hoy les dejo los mejores 60 proyectos que hice en esos dos últimos 60 días, si te perdiste de alguno aqui los tienes todos para que disfrutes de una terapia de ahorro y creatividad, espero que les guste y que me den muchos likes y muchos comentarios, un fuerte abrazo para ustedes y muchisimas bendiciones', 25, '/media/963a732d-7aa4-51ae-81a0-5143e8f6acd3/thumbnail.webp', '/media/963a732d-7aa4-51ae-81a0-5143e8f6acd3/video.mp4', CAST('651b0392-28fa-5cc5-baca-cdb6f4699e6e' AS UUID), 1443085, 14993, CAST('2022-06-15T11:00:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), 'PEOPLE_AND_BLOGS'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND category = 'PEOPLE_AND_BLOGS') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ca0a17d7-697e-5be1-a6d7-4df90b942852' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'ElenaArriaza-b1j', 'Espectacular 😊', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ca0a17d7-697e-5be1-a6d7-4df90b942852' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9f1644bb-ea58-57ac-8dec-88098720b076' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'miguelitosdiy', 'Hola Elena ❤ muchas gracias por ver y apoyar mis ideas ❤', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9f1644bb-ea58-57ac-8dec-88098720b076' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bdf6ef5c-7bbf-54c3-93e7-5d0b8e8850f4' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'PaperReviveDIY', 'After watching this I just want to quit my job and do DIY all day', NULL, CAST('2026-04-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bdf6ef5c-7bbf-54c3-93e7-5d0b8e8850f4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f3710250-300b-5d9f-9e90-eebeef044f2d' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'miguelitosdiy', 'Thank you so much! I’m really glad you liked my idea 😊. Your support means a lot and motivates me to keep creating more content for the channel.', NULL, CAST('2026-04-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f3710250-300b-5d9f-9e90-eebeef044f2d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('82475879-1fbd-54e6-8e8c-e765ba4c6a56' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'MariluGuerrero-g1c', 'AMIGO ,YO MIRANDO EL CL😀....PORQUE TIENES  CADA OCURENCIA FANTÁSTICAS  Y HERMOSAS!😊😊😊', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('82475879-1fbd-54e6-8e8c-e765ba4c6a56' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('954eeed3-fa30-52ea-aca0-59a20c829827' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'miguelitosdiy', 'jajaja me alegra que te gusten las ocurrencias! Muchas gracias ❤❤❤', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('954eeed3-fa30-52ea-aca0-59a20c829827' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0e35b56e-d988-5c16-8040-5f40c1cfd41f' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'lindafryer4515', 'Miguelitos I enjoy yr diys so much I have always did them since I was a child. Can''t send no pic . I watch you every day so glad I found yr channel.', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0e35b56e-d988-5c16-8040-5f40c1cfd41f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f928cdcb-cd20-5ca7-bb9d-4b09b25ee33b' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'miguelitosdiy', 'Hi dear 😊 thank you so much for your support 😊', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f928cdcb-cd20-5ca7-bb9d-4b09b25ee33b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('523f0318-c426-59b1-a971-67042399f058' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'TrevorDanni', 'Such a great presentation.', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('523f0318-c426-59b1-a971-67042399f058' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4258866f-8f09-5807-ba92-a7017d006d4e' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'miguelitosdiy', 'Thank you so much! 🫶 I’m really happy you liked the ideas.', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4258866f-8f09-5807-ba92-a7017d006d4e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d62bcb6e-06a8-5290-b3a1-32ab95a4fab4' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'GomezGladys-t3o', 'This deserves way more attention.', NULL, CAST('2025-10-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d62bcb6e-06a8-5290-b3a1-32ab95a4fab4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8d7d02ce-a573-5bdb-905a-e83472288481' AS UUID), CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID), NULL, 'miguelitosdiy', 'This kind of support keeps me inspired 🙏 appreciate you.', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8d7d02ce-a573-5bdb-905a-e83472288481' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('963a732d-7aa4-51ae-81a0-5143e8f6acd3' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('c3ee4eda-fc85-505a-9832-716a2351ac26' AS UUID), 'seed-channel:c3ee4eda-fc85-505a-9832-716a2351ac26', 'c3ee4eda-fc85-505a-9832-716a2351ac26@catalog.invalid', 'Little King Goods', CAST('2019-10-11T12:48:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2019-10-11T12:48:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('c3ee4eda-fc85-505a-9832-716a2351ac26' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), 'Making a HANDMADE Leather Flap Wallet - HYPER ASMR!', 'Make your own FLAP WALLET! https://bit.ly/2SW6McO

VISIT THE GOODS AND SUPPLY STORES
====================================
Little King Goods 
USE CODE: WELCOME10 for 10% off your first purchase (Excludes Bags) 
https://littlekinggoods.com

Little King Supply Co 
https://littlekingsupplyco.com/

Follow us on INSTAGRAM:
https://www.instagram/little.king.goods
https://www.instagram/littlekingsupplyco

SUPPORT LKG ON PATREON: https://www.patreon.com/Littlekinggoods

LEATHER TEMPLATES & PATTERNS
====================================
Little King Supply Co - 
 Templates: https://bit.ly/3Gu1M5u
 Patterns: https://bit.ly/3rhg5Ed

Little King Goods -
 Templates: https://bit.ly/34TNz43
 Patterns: https://bit.ly/3Fs9ADx

LEATHER CRAFTING TOOLS I USE
====================================
Glue Marker: https://littlekingsupplyco.com/products/lksco-refillable-glue-markers?_pos=2&_sid=9b8f87fa1&_ss=r
Pricking Irons: https://bit.ly/3zXJwPH
Edge Beveler: https://bit.ly/3noGZZt
Scratch Awl: https://bit.ly/3ts1eJL
Burnisher: https://bit.ly/3FvSqVs
Skiving Knife: https://bit.ly/34WNkW1
French Edger (Skiver): https://bit.ly/3frHkq0
Bone Folder: https://bit.ly/3Z2oKwB

LEATHER CRAFTING SUPPLIES 
====================================
Vinymo Thread: https://bit.ly/3Fo2FeA
Tokonole Burnishing Gum: https://bit.ly/33BitgG
Smiths Leather Balm: https://bit.ly/31YOM90
Premium Scrap Leather Boxes: https://bit.ly/3Gxb1BR

LEATHER MACHINES I USE
4-TON MIGHT WONDER CLICKER PRESS: 
https://bit.ly/4dFDCFF

8-TON MIGHTY WONDER CLICKER PRESS:
https://bit.ly/3Z2kRrF

POWER EDGE BURNISHER:
https://bit.ly/4fTQSbk

SAVE up to $500 on a GLOWFORGE LASER CUTTER! 
https://www.glowforge.com/littlekinggoods 

Large Masking Tape : https://amzn.to/2XZYVfs 
Cutting Mat: https://amzn.to/2n2kNby OLFA Rotary Knife: https://amzn.to/2lzxc6q 
Brass Pattern Knife: https://bit.ly/4g09W7Y
Foam Brushes: https://amzn.to/2nG4GRg 
The Paint Brush Cover: https://amzn.to/2LgB6Ls 
Water-Based Adhesive: https://bit.ly/3X3S1o9
Wing Divider: https://bit.ly/3Ta35Pp
Tandy 4 in 1 Punch: https://amzn.to/2xltQKg 
Nylon Mallet: https://bit.ly/3Ta35Pp_pos=1&_sid=7478b5d68&_ss=r
Japanese Vinymo Thread: https://bit.ly/3WV0hGQ_pos=1&_sid=e53018128&_ss=r
Maine Thread: https://www.mainethread.com/ 
John James Needles: https://bit.ly/3Xm3D7x
Dream Factory Stitching Pony: https://www.etsy.com/ca/listing/583248914/leather-clampleather-craft-toolstitching?ref=shop_home_active_2&crt=1 
Sand Paper: https://amzn.to/2lxKb8H 
Thread Zap II: https://bit.ly/4dXNeeT
Edge Marker: https://littlekingsupplyco.com/products/edge-marker-empty?_pos=1&_sid=ec5d68814&_ss=r&variant=42840042569888
Edge Rougher: https://amzn.to/2K8116x 
Craft Tool Corner Punch: https://amzn.to/2z2nPT5', 22, '/media/0972f03f-db2d-5d98-bddf-391874085c5b/thumbnail.webp', '/media/0972f03f-db2d-5d98-bddf-391874085c5b/video.mp4', CAST('c3ee4eda-fc85-505a-9832-716a2351ac26' AS UUID), 5322768, 90664, CAST('2019-10-11T12:48:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), 'EDUCATION'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND category = 'EDUCATION') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('780b718a-16de-5725-8f40-5916bf24b6ef' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'TheGriegs', '$30usd? OMG no.', NULL, CAST('2026-09-09T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('780b718a-16de-5725-8f40-5916bf24b6ef' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('08a8ecfa-a845-5310-b480-6a75b6dd836e' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, '3NILE', 'Wow😮💎🔥🐴She’ll Cordovan!?😮😮😮', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('08a8ecfa-a845-5310-b480-6a75b6dd836e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d8d60c87-bf37-5d3f-9217-f4db564b1f14' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'Alghamdiim', 'Brilliant. Alas hammering was a deal breaker for me 😢', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d8d60c87-bf37-5d3f-9217-f4db564b1f14' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('949beb23-1328-502b-bfb6-96addb30cb20' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'leatheraccessories646', 'I don''t understand why you don''t just slightly dampen the leather where the fold goes.
When it''s slightly damp, it bends much more easily without putting stress on the fibers.
I don''t understand why you burnish the edge first and only then dye it.
If you dye it first, the dye penetrates the fibers better; the way you''re doing it—dyeing after the fibers have been fully compressed—results in just a surface coating that won''t last very long, especially since you''re applying dye over another chemical treatment.', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('949beb23-1328-502b-bfb6-96addb30cb20' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ae2e3550-7a91-5010-b139-26d4e51aed25' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'LittleKingGoods', 'Shell cordovan doesn’t react well with water as it’s a membrane and not skin. The dye afterwards does penetrate and leaves a lighter finish. I didn’t want it to be too dark.', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ae2e3550-7a91-5010-b139-26d4e51aed25' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8f08ce76-1d0d-5185-b6dd-64f8d9aa82ca' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'schematicas', 'Мобильная  кожаная шариковая ручка


https://youtu.be/1Q58eA5lqUM?si=3xGbPSh2Mn7uk3du', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8f08ce76-1d0d-5185-b6dd-64f8d9aa82ca' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e0261ca7-b70b-5b25-860d-0690e9ca309e' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'ssjk-ct1cl', 'I''ve watched this to many times 😂', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e0261ca7-b70b-5b25-860d-0690e9ca309e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bf1be7e8-47c4-5839-b441-cf55d90f0a18' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'mrgood1cor13', 'Newer to leather crafting so genuine question: Why burnish first prior to the dye marker? Wouldnt you want to dye first so it soaks into the fibers (1,2, 3 coats) and then seal it in with tokenole and burnish? Thanks in advance! Great work!', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bf1be7e8-47c4-5839-b441-cf55d90f0a18' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bfd9685c-c48d-5904-b146-cfb0089548b0' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'whotao2074', '7:20-7:23 is a name for my dnd character kenku lmao', NULL, CAST('2026-04-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bfd9685c-c48d-5904-b146-cfb0089548b0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('458409ab-b04a-5938-9a6f-8ec898aa82be' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'gabowuwu2877', 'what do you put in your edge marker?', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('458409ab-b04a-5938-9a6f-8ec898aa82be' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('71e3c4d6-e73b-58f7-931b-4e4e5bb6ed68' AS UUID), CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID), NULL, 'LittleKingGoods', 'Leather Dye', NULL, CAST('2026-03-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('71e3c4d6-e73b-58f7-931b-4e4e5bb6ed68' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0972f03f-db2d-5d98-bddf-391874085c5b' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('2445872c-06cf-586c-b6ba-8e010e9b7bd1' AS UUID), 'seed-channel:2445872c-06cf-586c-b6ba-8e010e9b7bd1', '2445872c-06cf-586c-b6ba-8e010e9b7bd1@catalog.invalid', 'Springbok Craft Co', CAST('2021-04-27T14:20:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2021-04-27T14:20:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('2445872c-06cf-586c-b6ba-8e010e9b7bd1' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID), 'EASY DIY: Homemade Leather Trinket Trays', 'Make leather valet/trinket dishes using a technique called wet molding. 
It''s a SUPER EASY DIY, only 3 things required: 
- Vegetable Tanned Leather (I use 5 oz in this video)
- Round Pyrex Containers
- Water 

Please like and subscribe. It truly goes along way in supporting our small business.

Our Leather Goods: https://springbokcraftco.com/
Patterns and Supplies/Leather: https://springbokcraftco.com/collections/digital-patterns

CAMERA GEAR:
Canon M50: https://amzn.to/33LpHvm
Lighting: https://amzn.to/3uNpG67 + https://amzn.to/3tI3Pf3
Canon 50MM Lens: https://amzn.to/3ffE2Wj
Canon 22MM Pancake Lens: https://amzn.to/3oqyNHP
Gear for Filming Overhead Shots:https://amzn.to/3y7K6cf

LEATHERCRAFT GEAR:
Hole Punches: https://amzn.to/2SSGieV
Corner Punches: https://amzn.to/3blMRwI
Pricking Irons: Kevin Leather Tools
Edge Bevelers: Kevin Leather Tools
Strap Cutter: https://amzn.to/3ydpboi
Mallet: Barry King Mallet (Rocky Mountain Leather Supply)
Hot Stamping Machine: https://amzn.to/2RSBQfm
Gold Foil: https://amzn.to/33EE6th
Cutting Mat: https://amzn.to/3obURpm
Cutting Board (For hammering): https://amzn.to/33HZA8I
1 Ton Arbor Press: Princess Auto
4 Ton Clicker Press: https://amzn.to/3oh3XkQ
Refillable Dye Markers: https://amzn.to/3hjXwMi
Burnishing Agent Tokonole: https://amzn.to/3tLitSS
Best Scissors Ever: https://amzn.to/3ffEcwT

As an Amazon Associate I earn from qualifying purchases.

WHERE I GET MY LEATHER
OA Leather Supply
Tandy Leather
Acadia Leather
Maverick Leather
Jim Newman Leathers

Music:
We Got Something by LiQWYD https://soundcloud.com/liqwyd​​​​​
Creative Commons — Attribution 3.0 Unported — CC BY 3.0
Free Download / Stream: http://bit.ly/we-got-something​​​​​
Music promoted by Audio Library https://youtu.be/bpVHmUcAbWA​​​', 24, '/media/1b940112-3811-5602-a2d7-ffb3866b2236/thumbnail.webp', '/media/1b940112-3811-5602-a2d7-ffb3866b2236/video.mp4', CAST('2445872c-06cf-586c-b6ba-8e010e9b7bd1' AS UUID), 22692, 890, CAST('2021-04-27T14:20:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID), 'HOWTO_AND_STYLE'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID) AND category = 'HOWTO_AND_STYLE') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('66c84aea-d209-5335-9969-482d6c3b6f33' AS UUID), CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID), NULL, 'codywarren1657', 'What ounce of veg tan did you use. Assuming its veg tan*', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('66c84aea-d209-5335-9969-482d6c3b6f33' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4b1302f1-2f63-5f86-b985-9b58d5b3cbe6' AS UUID), CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID), NULL, 'stevemalone2010', 'I just watched it again, thanks', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4b1302f1-2f63-5f86-b985-9b58d5b3cbe6' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('44f7c7a4-2f57-5eb3-879c-f404f0a26b1f' AS UUID), CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID), NULL, 'annalindner3500', '4:06 What polish/wax is this?', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('44f7c7a4-2f57-5eb3-879c-f404f0a26b1f' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('310ffbdd-9992-5d36-a924-2d6991b6a2f0' AS UUID), CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID), NULL, 'patch1459', 'Tokonole', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('310ffbdd-9992-5d36-a924-2d6991b6a2f0' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('1b940112-3811-5602-a2d7-ffb3866b2236' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('b4334d03-b3bc-530b-8169-b873d5578fd6' AS UUID), 'seed-channel:b4334d03-b3bc-530b-8169-b873d5578fd6', 'b4334d03-b3bc-530b-8169-b873d5578fd6@catalog.invalid', 'Kingdom Glory Leather', CAST('2022-12-04T14:19:36.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2022-12-04T14:19:36.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('b4334d03-b3bc-530b-8169-b873d5578fd6' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID), 'The Mystery Braid - How It’s Made - Leather Craft', 'Ever wondered how a mystery braid is made? In this leather craft video I show all the steps I used to measure and make this tooled leather braided band. A mystery braid project can be a great gift idea for someone, not to mention it’s also an awesome canvas for creative tooling and finishing. I hope you enjoy this leather craft video and I hope it takes some of the mystery out of making a mystery braid project.

What is the Gospel? 👇
https://www.youtube.com/watch?v=KmKZJx5AlWY&t=37s

Check out my work on my Instagram account .
Follow me at: 👇
https://www.instagram.com/kingdomgloryleather/

Music from Uppbeat (free for Creators!):
https://uppbeat.io/t/zayner/falling
License code: JMSLZZ8HUJFCXLWX', 26, '/media/a5298d3d-7ebc-5100-b467-cea702034aa8/thumbnail.webp', '/media/a5298d3d-7ebc-5100-b467-cea702034aa8/video.mp4', CAST('b4334d03-b3bc-530b-8169-b873d5578fd6' AS UUID), 103203, 3324, CAST('2022-12-04T14:19:36.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID), 'HOWTO_AND_STYLE'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID) AND category = 'HOWTO_AND_STYLE') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1b138884-0dfd-5ce7-89e0-3a38bb288a53' AS UUID), CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID), NULL, 'KingdomGloryLeather', 'What is the Gospel?
👉 https://www.youtube.com/watch?v=KmKZJx5AlWY&t=37s 👈', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1b138884-0dfd-5ce7-89e0-3a38bb288a53' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8d98e2ee-0095-5f85-8fc2-a05568fd6f8b' AS UUID), CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID), NULL, 'james2592OldLeatherSmith', 'Excellent Job, especially 4 beginners, nothing hss 2 B said U explain it effectively. 
 GOD''S BLESSINGS ✝️ 🥎 🙃', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8d98e2ee-0095-5f85-8fc2-a05568fd6f8b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5164e26d-8a6d-5dfc-857a-e065101cd3ff' AS UUID), CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID), NULL, 'paulpurser8864', 'Thank  you for the detailed instructions and tool/supplies info.', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5164e26d-8a6d-5dfc-857a-e065101cd3ff' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('263f7153-f4ae-5e0e-990b-9fc053194e9b' AS UUID), CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID), NULL, 'srpttk', '👏👏👏🌺', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('263f7153-f4ae-5e0e-990b-9fc053194e9b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('a5298d3d-7ebc-5100-b467-cea702034aa8' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('3c08882d-f10f-5d64-9fc2-9a51b9084514' AS UUID), 'seed-channel:3c08882d-f10f-5d64-9fc2-9a51b9084514', '3c08882d-f10f-5d64-9fc2-9a51b9084514@catalog.invalid', 'EPODEX - España', CAST('2021-03-09T10:30:24.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2021-03-09T10:30:24.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('3c08882d-f10f-5d64-9fc2-9a51b9084514' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), 'Procesamiento de resina epoxi 1x1 | EPODEX Tutorial', '¿Hasta qué altura puedo colar?, ¿Cuánto tiempo necesita la resina para endurecerse?, ¿Cuándo gelifica la resina y cuándo dibujar los patrones de color? En este vídeo te explicamos el procedimiento 1x1 de la resina epoxiv.

EPODEX - ¡Apuesta por lo mejor!', 29, '/media/0abff798-d960-5a80-86ef-4f23e4774f24/thumbnail.webp', '/media/0abff798-d960-5a80-86ef-4f23e4774f24/video.mp4', CAST('3c08882d-f10f-5d64-9fc2-9a51b9084514' AS UUID), 109390, 1517, CAST('2021-03-09T10:30:24.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), 'PEOPLE_AND_BLOGS'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND category = 'PEOPLE_AND_BLOGS') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e630e939-19ab-5738-bb0a-7f9916627a27' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'Alesaxo1133', 'A México envían??', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e630e939-19ab-5738-bb0a-7f9916627a27' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f50f29d7-19c8-571b-93c3-9118f192f56b' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'epodex-espana', 'Hola,
No hacemos envíos a México. Sin embargo enviamos a todo Estados Unidos.

Consulte el sitio web aquí: 
https://www.epodex.us/

Tal vez usted puede hacer que alguien que usted conoce reciba los bienes en los EE.UU., y luego ellos pueden enviarlos a usted en México.

Equipo EPODEX', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f50f29d7-19c8-571b-93c3-9118f192f56b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c6fcf996-eb29-5764-be14-8db318ebd426' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'linar7690', 'Hola. Hice un accesorio esférico con Gemelos Epoxi (resina epóxica) donde embebí un elemento de oro, pero quedó mal y quiero recuperar el oro. ¿ Con qué se puede disolver la resina solidificada? ¿Cómo?', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c6fcf996-eb29-5764-be14-8db318ebd426' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c6da3398-592a-5c1f-aaaa-c951907df2d3' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'epodex-espana', 'Hola,
Consulte específicamente al fabricante de estos productos.', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c6da3398-592a-5c1f-aaaa-c951907df2d3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('856f63ca-883b-5988-ac6e-96a19eaab274' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'FerdinalAcunado-kc4tc', 'Hola compre el producto pero yo soy artesano.quiero usarlo como barniz.solo capas finas como calculo las porciones.de cada producto', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('856f63ca-883b-5988-ac6e-96a19eaab274' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('67274fce-0fc6-5aad-b8bf-bac6e3efc7c5' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'epodex-espana', 'Si viertes menos de 1.5 milímetros de resina epoxi sobre una superficie, será demasiado delgada para curar correctamente. Puedes usar la calculadora de epoxi en nuestra página de producto para medirlo. Ve a la página del producto y haz clic en [Calcular cantidad] debajo del precio. Podrás introducir las dimensiones de tu vertido de epoxi deseado y calcular el peso.

Te recomendamos usar nuestra resina de poliuretano como barniz. Aquí está el enlace: https://www.epodex.com/es/producto/resina-de-poliuretano-2k-en-acabados-brillante-y-mate-todos-los-colores/', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('67274fce-0fc6-5aad-b8bf-bac6e3efc7c5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6f04fa3d-02f0-57be-9f71-9ef602b1aa5a' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'BrayanRincon-sg5kf', 'Pregunta espero mi respuesta.!  La recina se puede echar en piso pulido', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6f04fa3d-02f0-57be-9f71-9ef602b1aa5a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b4fe8439-7418-572d-9f9d-9b36ceff2044' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'epodex-espana', 'Hola,

¿Qué tipo de suelo pulido?

EPODEX', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b4fe8439-7418-572d-9f9d-9b36ceff2044' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d9d492bb-d225-56ca-97f6-92907c474a1c' AS UUID), CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID), NULL, 'Samiraresina', 'Hola porque hace como un polvo arriba cuando pongo en superficie tarda 5 minutos y sale como cuando congela agua ?', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d9d492bb-d225-56ca-97f6-92907c474a1c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0abff798-d960-5a80-86ef-4f23e4774f24' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('06fa6695-4749-5c95-8116-29966ee2f9c9' AS UUID), 'seed-channel:06fa6695-4749-5c95-8116-29966ee2f9c9', '06fa6695-4749-5c95-8116-29966ee2f9c9@catalog.invalid', 'Crear más y mejor', CAST('2021-08-08T18:40:18.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2021-08-08T18:40:18.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('06fa6695-4749-5c95-8116-29966ee2f9c9' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), 'TUTORIAL 🔅Acabado CRISTAL con resina EPÓXICA. TABLERO de MADERA con EPOXY', '⚡️Te Muestro cómo hacer este ACABADO EFECTO CRISTAL con resina epóxica o epoxy en un tablero de mesa hecho con 8 tipos de MADERAS nobles. Explicado PASO a PASO para PRINCIPIANTES, puedes hacer estas manualidades en casa con pocas herramientas.

¿Qué es resina epóxica y para qué sirve?
La resina epoxi se puede moldear para formar y reparar objetos. Es una de las alternativas más comunes para los revestimientos industriales porque es flexible y resistente a los cambios de temperatura, lo que la hace ideal para aplicaciones comerciales.

🟢  Comienza en la carpintería sin TALLER ni HERRAMIENTAS ELÉCTRICAS:
https://www.crearmasymejor.com/

🎁   TABLAS de cocina PREMIUM 100% artesanales:
https://praestawood.com/collections/tablas-de-corte-testas


✅   Pulidora    👉 https://amzn.to/3lFm7xf
✅   Pulimento       👉 https://amzn.to/3lJeR3x
✅   Lijas 150mm         👉 https://amzn.to/3jD7xnc
✅   Lijadora Bosch orbital    👉 https://amzn.to/39elHGj
✅   Lijas 125mm                           👉 https://amzn.to/3yyBU4A
✅   Epoxy                                               👉 https://amzn.to/3AiFBvu
✅   Cera líquida                                            👉 https://amzn.to/3CswwSQ



🔥MI EQUIPO DE GRABACIÓN🔥

✅Cámara Canon M50 👉 https://amzn.to/2L4xwqC
✅Cámara de acción GoPro 👉 https://amzn.to/2XlDRjW
✅Micrófono Rhode 👉 https://amzn.to/3hPHVCt
✅Trípode Manfrotto 👉  https://amzn.to/3s5ls8Y
✅Iluminación 👉 https://amzn.to/3pZJkcw
✅Auriculares Sony (cancelación de ruido) 👉 https://amzn.to/3nq2pTc
✅Micro inalámbrico Rode 👉 https://amzn.to/3pE3BUo
✅Micro Blue Yeti 👉 https://amzn.to/3xOuXw0', 20, '/media/f6f31cee-2842-5c61-840c-7caf82beeea4/thumbnail.webp', '/media/f6f31cee-2842-5c61-840c-7caf82beeea4/video.mp4', CAST('06fa6695-4749-5c95-8116-29966ee2f9c9' AS UUID), 408948, 4611, CAST('2021-08-08T18:40:18.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), 'ENTERTAINMENT'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND category = 'ENTERTAINMENT') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('75f4f7db-25d6-50f7-937f-d11e03ef898c' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'Crearmasymejor', '✅ ARTE hecho con madera 👉 www.crearmasymejor.com', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('75f4f7db-25d6-50f7-937f-d11e03ef898c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5f40d389-92bd-5774-8b8f-545d97d68d4d' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'juanpablomatoso6689', 'Muy buen trabajo amigo!! Yo hago mesas de mármol con tiras parecidas a las de tu video, alguna sugerencia para hacer un trabajo tan lindo como el tuyo? Desde ya muchas gracias!', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5f40d389-92bd-5774-8b8f-545d97d68d4d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1ec4056e-435c-5e76-b816-8a9ece162a17' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'Crearmasymejor', 'Mírate los vídeos del canal porque tienes muchísima información 👍', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1ec4056e-435c-5e76-b816-8a9ece162a17' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0f04bf96-325a-5470-9d6a-8f41e767ac3e' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'juanpablomatoso6689', ' @Crearmasymejor  daleee gracias!', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0f04bf96-325a-5470-9d6a-8f41e767ac3e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c8ab0341-def6-50dd-92cb-2011745f348c' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'federicoolmedo2788', 'Muy bien trabajo! Una consulta tengo, hago unos jarros de madera tipo chop, y quería cubrirlos en el interior con resina, cuál me recomendarías? Y como sería la colocación? La idea es impermeabilizarlo c esa resina', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c8ab0341-def6-50dd-92cb-2011745f348c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d6892b0e-914e-553e-8d82-07bedf2d49ef' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'Crearmasymejor', 'Resinpro 👍', NULL, CAST('2026-09-29T21:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d6892b0e-914e-553e-8d82-07bedf2d49ef' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('00821756-e324-5237-96fa-5f5331b9b89d' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'Manuel-v6f8l', 'Hola los cantos como se pueden cubrir con ese material?', NULL, CAST('2026-09-02T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('00821756-e324-5237-96fa-5f5331b9b89d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('306f0e9b-f291-5c03-bc50-bd0e53237a37' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'Crearmasymejor', 'Sí', NULL, CAST('2026-09-02T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('306f0e9b-f291-5c03-bc50-bd0e53237a37' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('761b713b-830b-5023-b713-98edaac365b9' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'ricardofernandezcasal6899', 'Buenas tardes, qué tipo de cinta utilizas para los bordes . Gracias', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('761b713b-830b-5023-b713-98edaac365b9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3b16a7ac-cbb5-5ca8-9929-b233ace5075e' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'Crearmasymejor', 'Cinta de carrocero', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3b16a7ac-cbb5-5ca8-9929-b233ace5075e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('11a2fdb9-1850-55e9-9fe6-5fc176d93e0d' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'ricardofernandezcasal6899', '@Crearmasymejormuchas gracias!!!', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('11a2fdb9-1850-55e9-9fe6-5fc176d93e0d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bfe6d116-f10f-536f-b587-15e4658ae354' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'juangzlez9201', 'A qué temperatura ambiente estabais', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bfe6d116-f10f-536f-b587-15e4658ae354' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7454ed82-7d3d-5127-b27e-98703c1025eb' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'Crearmasymejor', '25°', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7454ed82-7d3d-5127-b27e-98703c1025eb' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a227c8da-3bf9-5cdc-badf-c2d6cd4fc532' AS UUID), CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID), NULL, 'telendege', 'Si tras extender la resina, pones un cristal encima, no se quedaria liso directamente?', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a227c8da-3bf9-5cdc-badf-c2d6cd4fc532' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('f6f31cee-2842-5c61-840c-7caf82beeea4' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('8a2b9860-c72a-5c05-b8ac-fb3202ae3601' AS UUID), 'seed-channel:8a2b9860-c72a-5c05-b8ac-fb3202ae3601', '8a2b9860-c72a-5c05-b8ac-fb3202ae3601@catalog.invalid', 'Woodworking Art', CAST('2021-09-04T11:52:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2021-09-04T11:52:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('8a2b9860-c72a-5c05-b8ac-fb3202ae3601' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd' AS UUID), 'Wood Carving - BMW 420i Convertibles - Woodworking Art', 'The new BMW 420i Convertibles, BMW 420i is made of wood. The wooden BMW 420i has a removable convertible top that makes this wooden car interesting and unique.
This car was made to order by a my friend and now it belongs to him. If you want to have unique wooden cars in your collection, you can buy at my Etsy online shop: https://www.etsy.com/uk/shop/WoodworkingArtCrafts

Website: https://www.handicraft-art.net
Facebook: https://www.facebook.com/WoodworkingArtVN
Contact advertising and sales: woodworldhv@gmail.com

If you are interested in another topic about crafting knives and swords, you can visit our 2nd channel:
@MagnetHQ 

Thank you for watching - please help us reach 10.000.000 subscriptions.

If you enjoy please Like, Share it and don''t forget to Subscribe for more videos: https://bit.ly/2K1doCI​

Please do not upload our videos on any social platforms without our permission.

#woodcarving​​
#woodworking​​
#bmw420i', 20, '/media/8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd/thumbnail.webp', '/media/8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd/video.mp4', CAST('8a2b9860-c72a-5c05-b8ac-fb3202ae3601' AS UUID), 31919526, 146604, CAST('2021-09-04T11:52:59.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd' AS UUID), 'PEOPLE_AND_BLOGS'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd' AS UUID) AND category = 'PEOPLE_AND_BLOGS') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('eda5cc51-3d4b-5fb6-b160-e6e739fd9557' AS UUID), CAST('8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd' AS UUID), NULL, 'OmerKassanee-t9c', '٥٦٢ عمر مالك محمد جمال الدين الكاساني', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('eda5cc51-3d4b-5fb6-b160-e6e739fd9557' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8ac203dd-3a11-5c87-b9a9-85a6ee9ddcdd' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('1bda5f54-27f1-541d-a961-b1107fca45df' AS UUID), 'seed-channel:1bda5f54-27f1-541d-a961-b1107fca45df', '1bda5f54-27f1-541d-a961-b1107fca45df@catalog.invalid', 'Tool_Tips', CAST('2024-05-09T08:00:20.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2024-05-09T08:00:20.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('1bda5f54-27f1-541d-a961-b1107fca45df' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), 'Carpenter Carpentry Woodworking Tips and Tricks', '', 70, '/media/23aa57d8-606a-57d4-b39a-39c549b16d6d/thumbnail.webp', '/media/23aa57d8-606a-57d4-b39a-39c549b16d6d/video.mp4', CAST('1bda5f54-27f1-541d-a961-b1107fca45df' AS UUID), 2414241, 4719, CAST('2024-05-09T08:00:20.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), 'PEOPLE_AND_BLOGS'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND category = 'PEOPLE_AND_BLOGS') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('13204599-52c3-52c4-84a5-7ee21736927b' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'larrybulthouse455', 'Stupid is as stupid does', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('13204599-52c3-52c4-84a5-7ee21736927b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('52f66dff-57ec-5c48-a7ab-0d3392156a95' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'dismo021', '7:00 still had a lip', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('52f66dff-57ec-5c48-a7ab-0d3392156a95' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f92efbef-dc4c-546f-9c8d-bb1e3e48c09b' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'mwaarmwaremwar520', 'Thank you for sharing your skills 👍', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f92efbef-dc4c-546f-9c8d-bb1e3e48c09b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c9fb12b9-95d3-50b9-88e9-cf87ac7e1ddd' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'josegardead8946', 'Lo raya para no tirar el que ocupa 😅😅 ósea se puede confundir y botar la pieza grande 😅', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c9fb12b9-95d3-50b9-88e9-cf87ac7e1ddd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7a9ea483-2e8c-5cc5-a519-161c65101130' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'SquaredRooter', 'Fun fact. 
The word carpenter is reserved for those who have completed an apprenticeship and are part of a “guild” for lack of more modern words. Like the master builders. 
Jsut because you are a contractor and make money using a hammer it doesn’t make you a carpenter. Just as fixing your friends car on the weekend doesn’t make you a mechanic.', NULL, CAST('2025-12-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7a9ea483-2e8c-5cc5-a519-161c65101130' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('722c61b8-2053-5ec0-b3ee-c6423e847d53' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'JW-vo5gs', 'I’m impressed. It’s been a really long time since I’ve watched one of these videos and learned ZERO new tricks. Yet somehow you’ve done it!', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('722c61b8-2053-5ec0-b3ee-c6423e847d53' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7ac47b13-e8ef-50cd-9dc0-04a031fe9dfa' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'ScottCleve33', 'I can''t help but wonder when any of these ideas would come in handy.', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7ac47b13-e8ef-50cd-9dc0-04a031fe9dfa' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('558d67b0-1ff4-55db-8e52-77d47e0aa785' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'ds-rm5mu', 'Random match box car idea in the middle of woodworking 👍', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('558d67b0-1ff4-55db-8e52-77d47e0aa785' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('818c4980-e291-5171-a037-1c1bf0f11348' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'ds-rm5mu', 'You can saw sooo fast😮', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('818c4980-e291-5171-a037-1c1bf0f11348' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('721b4949-a769-5a45-b9da-5ceb51db83c9' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'mypointofview1111', 'This is such a highly skilled craft, highly respected in my opinion', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('721b4949-a769-5a45-b9da-5ceb51db83c9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('844c3d80-8d82-5bcd-97f8-ff5c9b8bc788' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'abbashussain52', 'Thank you so much for sharing these skills for beginners like myself, Jazak Allahu Khairon x', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('844c3d80-8d82-5bcd-97f8-ff5c9b8bc788' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1084c32a-05d0-5fb7-9dea-06f7ca447294' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'Stathisthefreak66', 'Love the motorised chisels. Must buy one.', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1084c32a-05d0-5fb7-9dea-06f7ca447294' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6f203808-c62b-5377-a51a-a6ef07ed87e4' AS UUID), CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID), NULL, 'sheilafox7500', 'Great video.  👍👍', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6f203808-c62b-5377-a51a-a6ef07ed87e4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('23aa57d8-606a-57d4-b39a-39c549b16d6d' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('1f339fa7-a814-599b-8bd8-49a355998e9b' AS UUID), 'seed-channel:1f339fa7-a814-599b-8bd8-49a355998e9b', '1f339fa7-a814-599b-8bd8-49a355998e9b@catalog.invalid', 'EcologíaVerde', CAST('2019-04-14T17:30:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2019-04-14T17:30:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('1f339fa7-a814-599b-8bd8-49a355998e9b' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), '+25 PLANTAS de INTERIOR RESISTENTES con POCA LUZ', 'Bienvenidos a EcologíaVerde, en este nuevo vídeo llamado “+25 PLANTAS de INTERIOR RESISTENTES con POCA LUZ” te enseñamos una gran variedad de plantas de interior resistentes a la oscuridad o a condiciones de poca luz natural para que puedas decorar el interior de tu casa aunque las condiciones para las plantas parezcan duras, pues verás que para muchas plantas, en realidad, son las más adecuadas. Si quieres conocer las plantas para interiores oscuros o con poca luz natural directa que te aconsejamos, quédate viendo este nuevo vídeo de EcologíaVerde en el que descubrirás los nombres, algunas características y verás sus imágenes para reconocerlas.

Además, si quieres conocer más acerca de las plantas de interior resistentes con poca luz, entonces entra en el artículo original de EcologíaVerde: https://bit.ly/2InpBke

Descubre en EcologíaVerde un canal de gran calidad dedicado al mundo de la ecología, el medio ambiente y la jardinería. Encontrarás contenido muy variado, tanto educativo sobre biología, ecología, zoología y más ciencias medioambientales, como guías y consejos de jardinería para que disfrutes al máximo de tus plantas dándoles los cuidados que necesitan. No esperes más para aprender y convertirte en un experto de la naturaleza. Entra, aprende y comparte experiencias. ¡Te lo pasarás genial!

Web de EcologíaVerde - https://www.ecologiaverde.com/', 21, '/media/0342fb26-2588-5fbc-bc50-9fb283d1c6a9/thumbnail.webp', '/media/0342fb26-2588-5fbc-bc50-9fb283d1c6a9/video.mp4', CAST('1f339fa7-a814-599b-8bd8-49a355998e9b' AS UUID), 1284085, 18629, CAST('2019-04-14T17:30:02.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), 'HOWTO_AND_STYLE'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND category = 'HOWTO_AND_STYLE') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('5a931505-9587-5714-abde-c89aaafe6ded' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'EcologiaVerde', '👇👇 Descubre otros INCREIBLES vídeos 👇👇
🌿 10 PLANTAS QUE FLORECEN TODO EL AÑO ➡️ https://t.ly/NP-1
🌿 3 PLANTAS PARA MEJORAR TU SALUD ➡️ https://t.ly/cKoT
🌿 PLANTAS PARA LA BUENA SUERTE ➡️ https://t.ly/ba6e', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 9
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('5a931505-9587-5714-abde-c89aaafe6ded' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a7592b75-c94e-54b6-a08a-bf959a5f3b88' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'sergiovenegas197', 'Consulta:
Soy de La Paz, Bolivia, una cuidad a más de 3000 msnm, ¿Qué plantas son las más eficientes y eficaces para una altura tan moustrosa? Lo he buscado y no he encontrado nada :(
Gracias :)', NULL, CAST('2022-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a7592b75-c94e-54b6-a08a-bf959a5f3b88' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a654ec24-68a4-57bf-9fe9-0f818685ac5e' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'mafelixrocha357', 'gracias por sus recetas es buno saber que Dios nos bendiga gracias bendiciones', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a654ec24-68a4-57bf-9fe9-0f818685ac5e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('cde6bdf8-cf82-5abe-a0b9-ada895e7dcc7' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'laurafournell8422', '..ⁿč', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('cde6bdf8-cf82-5abe-a0b9-ada895e7dcc7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('707170e3-aa34-5ce4-b04e-9503d08068c2' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'silcorradi9219', 'El anturium requiere mucha luz', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('707170e3-aa34-5ce4-b04e-9503d08068c2' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fde937b5-0bf6-5cfb-8e02-3ef5e6ee4c6a' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'silcorradi9219', 'Mis potes necesitan mucha luz y yo pregunte por plantas sin luz', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fde937b5-0bf6-5cfb-8e02-3ef5e6ee4c6a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('90eea051-1b30-5442-8aef-a8d3ac95fc50' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'silcorradi9219', 'Compre 2 violetas africanas y las puse adentro y casi se mueren.  Las tuve que sacar al exterior', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('90eea051-1b30-5442-8aef-a8d3ac95fc50' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ddb71060-8616-503f-b6d3-62e7d2a55f33' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'Rosasantillan-c3n', 'Gracias mandame todo lo que es bueno el jazmin como cuidarlo siempre se me seca', NULL, CAST('2026-02-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ddb71060-8616-503f-b6d3-62e7d2a55f33' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('23551e65-5a73-5f34-b75f-5f84a5951721' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'AleHana89', 'Amo los potos. Son tan agradecidos. Lástima que mi perro los destruye', NULL, CAST('2025-11-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('23551e65-5a73-5f34-b75f-5f84a5951721' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e0a1d58b-be5c-5976-9519-d08703775ebf' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'gracielaizquierdo132', 'Quite su anuncio a la chingada.', NULL, CAST('2025-10-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e0a1d58b-be5c-5976-9519-d08703775ebf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('021a732a-1579-5bfc-a25b-def5c9d9cdea' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'mariavictoriakildegaard3953', 'Tengo una cuna de moises que se está muriendo poco a poco 😢', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('021a732a-1579-5bfc-a25b-def5c9d9cdea' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ff112247-b02b-5676-8acd-f75cc4db149a' AS UUID), CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID), NULL, 'javirodriguez1598', 'Hubiera sido buena idea, aunque sea poner una foto de las que has comentado al final del vídeo.
Muchas gracias y a sido de gran utilidad el video', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ff112247-b02b-5676-8acd-f75cc4db149a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('0342fb26-2588-5fbc-bc50-9fb283d1c6a9' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), 'Guns N'' Roses - Paradise City (Official Music Video)', 'Official Music Video for "Paradise City" performed by Guns N'' Roses from their debut album, ''Appetite for Destruction.'' Featured in Thor: Love and Thunder. 

#AppetiteForDestruction: The Debut Album, Remastered and Expanded. Available now as Box Set, Super Deluxe, Double LP, and Double CD here: https://lnk.to/AppetiteForDestructionYD/gnrstore 

Apple Music: https://lnk.to/AppetiteForDestructionYD/applemusic 
iTunes: https://lnk.to/AppetiteForDestructionYD/itunes 
Spotify: https://lnk.to/AppetiteForDestructionYD/spotify 
Amazon: https://lnk.to/AppetiteForDestructionYD/amazon 
Google Play: https://lnk.to/AppetiteForDestructionYD/google-play 

Subscribe to Guns N'' Roses YouTube channel and never miss an update: https://GNR.lnk.to/YouTube

Watch more Guns N'' Roses official music videos: https://www.youtube.com/playlist?list=PLOTK54q5K4INNXaHKtmXYr6J7CajWjqeJ

Follow Guns N'' Roses:
Site: https://www.gunsnroses.com/ 
Facebook: https://www.facebook.com/gunsnroses 
Twitter: https://twitter.com/gunsnroses 
Instagram: https://www.instagram.com/gunsnroses 

Music video by Guns N'' Roses performing Paradise City. YouTube view counts pre-VEVO: 3,424,935. (C) 1988 Guns N'' Roses under exclusive license to Geffen Records

#GunsNRoses #GnR #ParadiseCity', 25, '/media/6d87870b-5902-51ff-aa37-f9a638403d42/thumbnail.webp', '/media/6d87870b-5902-51ff-aa37-f9a638403d42/video.mp4', CAST('f40e1da1-82ea-59a2-8413-75d57bcf1af6' AS UUID), 938405459, 3298438, CAST('2009-12-25T08:41:50.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), 'MUSIC'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND category = 'MUSIC') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fe313b16-2a9a-5c3e-b4b4-75c9c68fa6f3' AS UUID), CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), NULL, 'esenpauk', 'As Gen Z I wanna say this song is crazy🔥🔥🔥🔥🔥🔥🔥🔥🔥', NULL, CAST('2026-09-30T10:25:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fe313b16-2a9a-5c3e-b4b4-75c9c68fa6f3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('dfbb124d-b0cc-5cb2-8ebe-8cce3019949b' AS UUID), CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), NULL, 'silviac.4725', 'Naturalmente vedo Gabry💩', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('dfbb124d-b0cc-5cb2-8ebe-8cce3019949b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('88d22b8a-45ea-5c22-9804-01a17841b7c5' AS UUID), CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), NULL, 'silviac.4725', 'Axl bestAlbabianca forever🎤😜🇮🇹🇺🇲', NULL, CAST('2026-09-30T08:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('88d22b8a-45ea-5c22-9804-01a17841b7c5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('841a2174-1e98-5781-856f-3f0ef14b818c' AS UUID), CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), NULL, 'lucaswittdarosa6629', 'QUE CLIPE VAI TU TE FUDEE🔥', NULL, CAST('2026-09-30T05:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('841a2174-1e98-5781-856f-3f0ef14b818c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('efb7445f-256b-53ba-8245-1354a958ca74' AS UUID), CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), NULL, 'GuavaaaSwoft', 'did yall play that one driving game for the ps3 i dont remeber the name but it has this song', NULL, CAST('2026-09-30T03:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('efb7445f-256b-53ba-8245-1354a958ca74' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('153cfae5-0f90-591f-ab45-bea04a620b78' AS UUID), CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), NULL, 'ligiamatias4602', 'I love this music!❤❤', NULL, CAST('2026-09-29T15:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('153cfae5-0f90-591f-ab45-bea04a620b78' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e6d6d84e-4760-507e-bb98-aa217281335b' AS UUID), CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), NULL, 'jonbrrewintherhagen2025', '❤❤❤', NULL, CAST('2026-09-29T12:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e6d6d84e-4760-507e-bb98-aa217281335b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e2ddf606-02c2-5396-80cb-aefbb5bdcc3c' AS UUID), CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID), NULL, 'FarukNuhu-n1i', 'That s an easy thumbs up.', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e2ddf606-02c2-5396-80cb-aefbb5bdcc3c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6d87870b-5902-51ff-aa37-f9a638403d42' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('ea8144bf-2a65-5814-9b73-f65d135e7756' AS UUID), 'seed-channel:ea8144bf-2a65-5814-9b73-f65d135e7756', 'ea8144bf-2a65-5814-9b73-f65d135e7756@catalog.invalid', 'Ter', CAST('2024-06-10T15:54:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2024-06-10T15:54:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('ea8144bf-2a65-5814-9b73-f65d135e7756' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), 'Plantas de interior: ¿son un error? Arquitecta opina', '🔴 Quieres aprender Historia del Arte Clásico conmigo?
Visita Focusarte, mi plataforma de cursos online: https://focusarte.com/

Instagram: https://www.instagram.com/tercosmicqueen/
Twitter: https://twitter.com/tercosmicqueen
Facebook: https://www.facebook.com/tercosmicqueen/
TikTok: https://www.tiktok.com/@tercosmicqueen
https://www.tercosmicqueen.com/

00:00 mis plantas
01:11 Espatifilo
03:22 Calatea
05:22 Suculentas
07:08 Piña
08:07 Aeschynanthus
10:07 Plantas germinadas por mí', 30, '/media/936e55af-10ee-5d00-a13e-4cbc1f24eff5/thumbnail.webp', '/media/936e55af-10ee-5d00-a13e-4cbc1f24eff5/video.mp4', CAST('ea8144bf-2a65-5814-9b73-f65d135e7756' AS UUID), 970356, 89756, CAST('2024-06-10T15:54:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), 'PEOPLE_AND_BLOGS'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND category = 'PEOPLE_AND_BLOGS') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('82ee71ec-d6af-5e8a-9e48-20fac7817d7a' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'ispis367', '10:50', NULL, CAST('2026-09-16T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('82ee71ec-d6af-5e8a-9e48-20fac7817d7a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('43141c09-1d19-5ecf-8fda-e0e7e40ef786' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'diegose2311', 'Ter te extraño', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('43141c09-1d19-5ecf-8fda-e0e7e40ef786' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9fe6b96a-07a8-5ecd-bfac-2c5fbb1e9f0d' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'pedroedgarromerovazquez8844', 'We miss you TER 😢❤', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9fe6b96a-07a8-5ecd-bfac-2c5fbb1e9f0d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6825615c-0166-5a8e-8450-75f84a7a6982' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'Quemedejesenpaz', 'chof 😍 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ <🧭🕯💌🕯🫠~ blu blu blu blu

________________________________________________________________________________________
🪴<(ola k ase? soy el geranio del balcón de tu tía la de Cuenca)', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6825615c-0166-5a8e-8450-75f84a7a6982' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2304c450-94b2-595a-b1c2-d53c46db0de5' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'INTENSA-MENTE-DIVER-GENTE', 'No manches ya te amo. Ese diálogo tuyo 😎 Jajaja es tan gracioso, lúdico y dinámico. 🌿🌱🍃☘️🍀🪴🌵🌴🪻🌻🥀
Plantas honestas y deshonestas, líderes, integrales, improvisadas... vayatela!!!😆', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2304c450-94b2-595a-b1c2-d53c46db0de5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('da71d4c4-220e-55d5-96ff-bb6fd0bc3187' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'yo8102', 'Guapa... entre al video porque me gustas pero lo terminé viendo todo por lo gracioso.... nunca pensé que se podía clasificar las plantas por personalidad', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('da71d4c4-220e-55d5-96ff-bb6fd0bc3187' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('efb7b428-83c8-56f1-af09-9bacac51f166' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'elpensaderodeadri', 'Ter, te extraño. Estoy harta de todo el contenido de Youtube y de todas las redes sociales, nadie habla de cosas interesantes y sencillas a la vez como tu hablando de arquitectura y de plantas al mismo tiempo. He estado revisitando tus videos, porque nada del contenido nuevo me convence, nada me entusiasma, todo me aburre. ¿Cuando vuelves? Vuelve por favor 🙏🙏🙏', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('efb7b428-83c8-56f1-af09-9bacac51f166' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('39fcbd93-d37f-51d1-b469-6b214c085b0b' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'BancoDeArena', 'Yo creo que la que cuelga es muy honesta. Estaba bien porque lo estabas haciendo bien. Y, de hecho, ha florecido. Nada, nada, en la revisión, sobresaliente.', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('39fcbd93-d37f-51d1-b469-6b214c085b0b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('9f59167b-2d0c-5bab-96af-432b1e75314a' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'esculapiopapapero5308', 'Estás loca tia. 😂😂😂', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('9f59167b-2d0c-5bab-96af-432b1e75314a' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('23c8f624-2da0-5368-9e4d-332298f48247' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'augustoficoseco9954', 'Como se le ocurren estos videos? Espectacular', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('23c8f624-2da0-5368-9e4d-332298f48247' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6865d668-4123-51f1-851b-ca08112cdc8e' AS UUID), CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID), NULL, 'noeliaperez3328', 'Mi percepción es que las plantas mientras peor esté saca 1 flor pero solo 1 pq se va a morir fkdjf', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6865d668-4123-51f1-851b-ca08112cdc8e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('936e55af-10ee-5d00-a13e-4cbc1f24eff5' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('923bf948-bb47-5fe8-b118-3deb5e7d8c0c' AS UUID), 'seed-channel:923bf948-bb47-5fe8-b118-3deb5e7d8c0c', '923bf948-bb47-5fe8-b118-3deb5e7d8c0c@catalog.invalid', 'Cocinas Modernas Pequeñas | by Vicky', CAST('2023-06-07T19:26:36.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2023-06-07T19:26:36.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('923bf948-bb47-5fe8-b118-3deb5e7d8c0c' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), '💚 MEJORES PLANTAS DE INTERIOR CON POCA LUZ / Plantas de Interior RESISTENTES', 'Hoy te traigo las Mejores PLANTAS de INTERIOR RESISTENTES con POCA LUZ, para que puedas decorar el interior de tu casa, a pesar de las condiciones de oscuridad o sombra. 

Si te gusta todo lo relacionado con la Decoración del Hogar 
¡SUSCRÍBETE! bit.ly/3Wg3aRl  para que no te pierdas el contenido de valor que estaré subiendo cada semana.

✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶


🙏🏾 AGRADECIDA a mis Fuentes: 
📸Pinterest
Revista El Mueble https://www.elmueble.com/
Revista AD https://www.revistaad.es/decoracion
ElleDecor https://www.elledecor.com/es/decoracion/
Mi Casa https://www.micasarevista.com/
Revista Interiores https://www.revistainteriores.es/
Arquitectura y Diseño https://www.arquitecturaydiseno.es/
Hola https://www.hola.com/decoracion/


✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶




✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶✶

🎵 Track Info:

Música: 
Músico:


"plantas de interior"
"plantas de interior con poca luz"
"plantas de sombra"
"Plantas"
"plantas para interiores oscuros"
"flores de sombra"
"plantas interior"
"plantas de interior resistentes"
"plantas de sombra para interiores"
plantas de interior 
plantas de interior con poca luz 
plantas para interiores oscuros 
plantas de sombra', 20, '/media/62507a53-4c0c-5727-8667-efca789f0ee5/thumbnail.webp', '/media/62507a53-4c0c-5727-8667-efca789f0ee5/video.mp4', CAST('923bf948-bb47-5fe8-b118-3deb5e7d8c0c' AS UUID), 125092, 0, CAST('2023-06-07T19:26:36.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), 'EDUCATION'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND category = 'EDUCATION') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('1059c074-3e3e-5503-95a6-44f3577c1092' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'cocinasmodernaspequeñas', '¿Cuál de estas Plantas de Interior con poca Luz prefieres? 💗', NULL, CAST('2023-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 6
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('1059c074-3e3e-5503-95a6-44f3577c1092' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('02c30a03-62fb-5f27-917e-d50fc96ddbbf' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'richardymj', 'El ficus benjamina, si bien es cierto que es muy resistente, se debe mantener en el exterior, a pleno sol, siempre que no se tenga un clima muy frio claro...', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('02c30a03-62fb-5f27-917e-d50fc96ddbbf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8dab17a1-83de-5fed-ae39-0ebc2a304bf4' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'shawnlee6775', 'Gracias 🙏🏼', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8dab17a1-83de-5fed-ae39-0ebc2a304bf4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('aad51d8a-9688-5d07-a1ce-d00d814437bd' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'cocinasmodernaspequeñas', '💗', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('aad51d8a-9688-5d07-a1ce-d00d814437bd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0d789bee-a200-5d89-86c9-80d66b4dca89' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'focperquiperlla2015', 'En el video propones muchas plantas, pero son todo imágenes importadas... 🤔
Teniendo eso en cuenta y despues de haber escuchado con atención las esplicaciones que has compartido,
¿me pregunto si realmente nos compartes tu experiencia o si este video es simplemente un copiar y pegar de informaciones que has leído u oído de otros...?

Yo creo tener bastante clara cual es la respuesta correcta.', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0d789bee-a200-5d89-86c9-80d66b4dca89' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('f2d7eea2-8af3-5db9-af15-6d8031860ac9' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'cocinasmodernaspequeñas', 'Gracias por tu comentario y dedicar tu tiempo a escuchar con atención el vídeo. Es obvio que las imágenes que uso son para ilustrar mejor el contenido y hacer el vídeo visualmente atractivo, pero toda la información que comparto está basada en mi experiencia,  investigación y aprendizaje. Si tienes alguna duda específica sobre mi experiencia con alguna de las plantas, estaré encantada de ayudarte 🥰', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 2
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('f2d7eea2-8af3-5db9-af15-6d8031860ac9' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('671a0585-41b3-58c6-b4bb-d4dc8ed6f013' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'AngélicaevaristaFerreyra', 'Yo tengo lirio de paz y es muy linda  planta', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('671a0585-41b3-58c6-b4bb-d4dc8ed6f013' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('902de65d-09d3-507c-b826-5037752d29a4' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'cocinasmodernaspequeñas', '💚', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('902de65d-09d3-507c-b826-5037752d29a4' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('d55b42bc-a82c-553f-b5bc-e913d9b3a382' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'balbinaburgos1542', 'Me encantó la Civia', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('d55b42bc-a82c-553f-b5bc-e913d9b3a382' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0e4deb49-8b6b-5945-802a-6ad5499d62f8' AS UUID), CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID), NULL, 'cocinasmodernaspequeñas', '🥰💗', NULL, CAST('2025-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0e4deb49-8b6b-5945-802a-6ad5499d62f8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('62507a53-4c0c-5727-8667-efca789f0ee5' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('06488dd7-b188-5125-9814-b2b7c785eb45' AS UUID), 'seed-channel:06488dd7-b188-5125-9814-b2b7c785eb45', '06488dd7-b188-5125-9814-b2b7c785eb45@catalog.invalid', 'trxshedits', CAST('2017-12-02T18:16:54.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2017-12-02T18:16:54.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('06488dd7-b188-5125-9814-b2b7c785eb45' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), '[ASMR] hannibal lecter cooking', 'tingle tingle', 25, '/media/8f19fc02-1dba-55bb-809c-4da4f035698b/thumbnail.webp', '/media/8f19fc02-1dba-55bb-809c-4da4f035698b/video.mp4', CAST('06488dd7-b188-5125-9814-b2b7c785eb45' AS UUID), 34121874, 579012, CAST('2017-12-02T18:16:54.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), 'COMEDY'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND category = 'COMEDY') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('3738a0e2-3b97-5272-bba1-300c059460e7' AS UUID), CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), NULL, 'nicholasdh_63', 'The enhanced sfx is so diabolical', NULL, CAST('2026-09-30T04:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('3738a0e2-3b97-5272-bba1-300c059460e7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('2e77953d-8859-5064-b6da-31380fe3cf62' AS UUID), CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), NULL, 'JenniferOrtiz-k1h', '\', NULL, CAST('2026-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('2e77953d-8859-5064-b6da-31380fe3cf62' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('766eb982-70e7-5b74-b1e8-1e133feee6ef' AS UUID), CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), NULL, 'esormirp', 'bro has such a liver-y diet', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('766eb982-70e7-5b74-b1e8-1e133feee6ef' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('fbdd1149-7b7d-5fe6-b4b0-8685c90432d7' AS UUID), CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), NULL, 'Power_00-v7j', 'Mf looking scary even when cooking', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('fbdd1149-7b7d-5fe6-b4b0-8685c90432d7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('febecfa1-ec9f-56d2-be56-3adcaff99c77' AS UUID), CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), NULL, 'batkings1652', 'At the least people can’t call it in - humane😂', NULL, CAST('2026-09-29T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('febecfa1-ec9f-56d2-be56-3adcaff99c77' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('609fa560-fe53-5011-b658-165f57bc6359' AS UUID), CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), NULL, 'brayboi8641', 'Knowing that hes cooking people fucks me up', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('609fa560-fe53-5011-b658-165f57bc6359' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('29c31688-f043-5c8a-ab3b-5ce2d13ebf44' AS UUID), CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), NULL, 'YouKnowImOnMyPeriodYah', 'Are we really this uniquely gelatinous or is that just how all meat is? 💀
I feel like other animals don’t look this jelly-like', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('29c31688-f043-5c8a-ab3b-5ce2d13ebf44' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b145b198-f09b-5be7-963d-ebed1b5dc30e' AS UUID), CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID), NULL, 'SalaWati-y5k', 'That''s a HUMAN MEAT bro
WATCH THE MOVIES 😭😭', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b145b198-f09b-5be7-963d-ebed1b5dc30e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f19fc02-1dba-55bb-809c-4da4f035698b' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('bee077e7-e688-5934-841b-0e31f266b655' AS UUID), 'seed-channel:bee077e7-e688-5934-841b-0e31f266b655', 'bee077e7-e688-5934-841b-0e31f266b655@catalog.invalid', 'pateseich', CAST('2024-07-03T12:00:07.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2024-07-03T12:00:07.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('bee077e7-e688-5934-841b-0e31f266b655' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('6b57d162-6534-5137-bd22-60137d16a631' AS UUID), 'draw with me, color studies ♡⸝⸝ w/arrtx', 'Head to https://squarespace.com/pateseich to save 10% off your first purchase of a website or domain using code PATESEICH

⭐ illustration courses I highly recommend: https://domestika.sjv.io/R5ELZN
use my exclusive code ‘PATESEICH10’ for an extra 10% off any course, on top of any existing discounts ₊˚⊹

all my art supplies: https://myartsupplies.carrd.co/
use my code ''SEREIN10'' for 10% off everything at Meeden website: https://meedenart.com/?sca_ref=5327647.SQOgdfUDHn

you can find the markers here:

☆ Arrtx OROS 90 Colors Alcohol Markers
Amazon US: https://amzn.to/3JBBstp    
Amazon CA: https://amzn.to/3FEH4Bt
Amazon UK: https://amzn.to/3n2n5Gx
Amazon DE: https://amzn.to/3yQaM2O
Official: https://bit.ly/43tHjtW
AliExpress: https://bit.ly/435tuS5

☆ Arrtx OROS 48 Skin Tone Colors Alcohol Markers
Amazon US: https://amzn.to/3UyuxHL
Amazon CA: https://amzn.to/3Uhayxh
Amazon JP: https://amzn.to/48pA6fn
Amazon DE: https://amzn.to/3xoznhM

timestamp:
00:00 chapter 1
01:17 chapter 2
01:48 chapter 3
05:19 build your website
06:17 chapter 4

Website:  https://www.arrtx.com/
Instagram:  https://www.instagram.com/arrtxart/
Amazon Store:  https://www.amazon.com/arrtx
  @arrtxglobal  

---------------------------------------------------------------------------------------------
✱♡ let''s keep in touch! ♡✱

🌸 Instagram: https://www.instagram.com/pateseich/
☁️ Facebook: https://www.facebook.com/pateseich
🌙 Tiktok: https://www.tiktok.com/@pateseich
✨ All my links & socials: https://pateseich.carrd.co/
💌 For collab/inquiry: pateseich08@gmail.com 

---------------------------------------------------------------------------------------------
✦ reference pictures: https://www.pinterest.ph/Pateseich/ ✧ 

🎧music:
by @demongummies 
🎵bowser peaches - https://youtu.be/UXOFZW4MNM0?si=W8J5gX3AOXy9f7dp
check them out on Spotify ~ https://open.spotify.com/artist/186Z7...
or SoundCloud :)  /demongummies  
https://ko-fi.com/demongummies ~ buy them a cup of coffee ^_^

If you have any drawing or painting recommendations, let me know, leave a comment! 
and don''t forget to give this video a thumbs up and subscribe for more content like this ~ 

Have a fantastic day ! ⸜(｡˃ ᵕ ˂ )⸝♡

---------------------------------------------------------------------------------------------

#drawwithme #arrtxorosmarkers #arrtxmarkers #markersdrawing #portraitdrawing #artshorts #sketchbookart #markerart #sunghoon #enhypen #artdump #byeonwooseok #lovelyrunner #sketchbookspread #sketchdrawing #sketchbookart #artstyle #pateseich', 30, '/media/6b57d162-6534-5137-bd22-60137d16a631/thumbnail.webp', '/media/6b57d162-6534-5137-bd22-60137d16a631/video.mp4', CAST('bee077e7-e688-5934-841b-0e31f266b655' AS UUID), 313255, 15947, CAST('2024-07-03T12:00:07.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('6b57d162-6534-5137-bd22-60137d16a631' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('6b57d162-6534-5137-bd22-60137d16a631' AS UUID), 'HOWTO_AND_STYLE'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('6b57d162-6534-5137-bd22-60137d16a631' AS UUID) AND category = 'HOWTO_AND_STYLE') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6b57d162-6534-5137-bd22-60137d16a631' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('86fe3534-2775-5066-81c3-176ac9e487f7' AS UUID), CAST('6b57d162-6534-5137-bd22-60137d16a631' AS UUID), NULL, 'prabodithadilshan1757', 'Wow ❤', NULL, CAST('2026-09-26T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('86fe3534-2775-5066-81c3-176ac9e487f7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('6b57d162-6534-5137-bd22-60137d16a631' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('27471300-b409-5faf-912d-b5295929ebda' AS UUID), 'seed-channel:27471300-b409-5faf-912d-b5295929ebda', '27471300-b409-5faf-912d-b5295929ebda@catalog.invalid', 'Catalina Novelli Ilustracion', CAST('2020-05-11T01:01:26.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2020-05-11T01:01:26.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('27471300-b409-5faf-912d-b5295929ebda' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), 'ACUARELA PARA PRINCIPIANTES 💖⎟BÁSICO', '', 76, '/media/09fc40db-59f6-5bd2-b6b3-60db20356394/thumbnail.webp', '/media/09fc40db-59f6-5bd2-b6b3-60db20356394/video.mp4', CAST('27471300-b409-5faf-912d-b5295929ebda' AS UUID), 2333351, 107597, CAST('2020-05-11T01:01:26.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), 'PEOPLE_AND_BLOGS'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND category = 'PEOPLE_AND_BLOGS') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('408ce9b7-4f06-5ed1-983c-47acd9e5d0b3' AS UUID), CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), NULL, 'englishmonorrosana788', 'Podrías decir los números de los pinceles de la última acuarela?', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('408ce9b7-4f06-5ed1-983c-47acd9e5d0b3' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('19f03ac6-3f8c-5eec-b0bf-771f7376d9cf' AS UUID), CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), NULL, 'anamariademata8291', 'Muy bueno el tutorial comienzo a practicar!!!', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('19f03ac6-3f8c-5eec-b0bf-771f7376d9cf' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4e753900-421b-5e22-8953-98eb32bd15fd' AS UUID), CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), NULL, 'meli_we', 'Okey, ya sabía pintar con acuarela, pero se me olvidó, gracias por recordarmelo', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4e753900-421b-5e22-8953-98eb32bd15fd' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('6324217a-1502-537c-a8dd-1adecca15435' AS UUID), CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), NULL, 'samblue20', 'Que video tan interesante, lastima que mi madre hace indisfrutable el proceso 😢', NULL, CAST('2026-06-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('6324217a-1502-537c-a8dd-1adecca15435' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ad236118-67bf-5a01-bb54-dd6687c8426c' AS UUID), CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), NULL, 'cristinegutierrez5807', '¿Alguien sabe cómo se llama el pincel que utiliza?', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ad236118-67bf-5a01-bb54-dd6687c8426c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('b2dff2d8-b9b8-5dc3-a97b-b6d5ba9e247b' AS UUID), CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), NULL, 'marianamunoz6075', '¿Tienes más ejercicios así con práctica en proyecto para tener una pieza terminada mientras aprendemos?  ¿Muchos más?  Como una serie completa de aprendizaje paso a paso.!!!
Así monocromático es muy bonito!
Muchas gracias por el video', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('b2dff2d8-b9b8-5dc3-a97b-b6d5ba9e247b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('e0e2f161-86d0-596a-87b8-55683b868ea7' AS UUID), CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), NULL, 'marianamunoz6075', 'I can’t fond it either but I’ll keep lookin’ 🤣', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('e0e2f161-86d0-596a-87b8-55683b868ea7' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('a9dbf29c-3de6-5372-bd5f-9918a58dfbea' AS UUID), CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID), NULL, 'marianamunoz6075', '¡Guau! ¡Pero que bárbara.  Haces que todo esto se vea tan simple que me hace creer que yo pueda hacer eso.!!!!
Sé que este video ya tiene años pero te acabo de  encontrar.
¿Puedes hacer clases paso a paso para principiantes como yo?
O si ya los tienes, ¿me indicas cómo los encuentro porfis?
Muchas gracias.  ¡Qué bonito tu video.', NULL, CAST('2026-05-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('a9dbf29c-3de6-5372-bd5f-9918a58dfbea' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('09fc40db-59f6-5bd2-b6b3-60db20356394' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('30762215-0d1f-50e0-870b-479b29476169' AS UUID), 'seed-channel:30762215-0d1f-50e0-870b-479b29476169', '30762215-0d1f-50e0-870b-479b29476169@catalog.invalid', 'Alfredo Vozmediano', CAST('2024-02-15T18:00:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2024-02-15T18:00:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('30762215-0d1f-50e0-870b-479b29476169' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID), 'Cenas De Diario Mejores Que El Batch Cooking', 'Aprende a cocinar con mi escuela online: https://www.avozmechef.es/

Una alternativa al batch cooking y a pedir comida a domicilio, mucho más rica y estimulante.

INGREDIENTES:
PICKLES:
- 1 Pepino
- 1 manojo rabanitos
- 100ml agua
- 100g miel
- 200ml vinagre de manzana o de vino blanco

PESTO:
- 75g queso grana padano
- 1 diente de ajo
- 50g frutos secos
- 1 manojo de albahaca
- 100ml AOVE
- Sal

MIEL Y MOSTAZA:
- 3 cucharadas miel
- 2 cucharadas mostaza a la antigua
- cantidad suficiente de aceite de oliva 

TERIYAKI:
- 75g miel
- 150ml salsa de soja
- 40ml vinagre de arroz
- 1 cucharada aceite de sésamo

CARNE PICADA 2 raciones:
- 400g carne picada
- 1 Romanescu
- 1 cucharada polvo de curry
- 1 cucharada pasta de curry rojo
- 400ml leche de coco
- 1 manojo de espinaca baby
- 400g patatas guarnición
- Cilantro
- Queso rallado
- Pickles

SALMÓN 2 raciones:
- 400g salmón
- 1 manojo de espárragos
- Salsa de miel y mostaza
- 3 boniatos
- Pesto

MUSLITOS DE POLLO 2 raciones:
- 6 muslitos de pollo
- Salsa teriyaki
- 1,5 boniatos asados del día anterior
- 50g mantequilla
- 75ml leche
- 2 manojos de espinacas
- Salsa de miel y mostaza
- Queso de cabra
- Nueces

NOODLES 2 raciones:
- 150g noodles boniato
- 400g langostinos pelados
- 100g bimi
- 3 dientes de ajo
- Pesto

LOMO SALTADO 2 raciones:
- 150g arroz blanco
- 300ml agua
- 2 dientes de ajo
- 400g filetes de tapilla
- 1/2 pimiento rojo
- 1/2 pimiento verde
- 1/2 cebolla morada
- 1/2 cebolla blanca
- 2 dientes ajo
- 30g jengibre
- 200ml teriyaki

MATERIAL QUE UTILIZO O RECOMIENDO
MATERIAL QUE UTILIZO O RECOMIENDO
Encendedor https://amzn.to/3Lujavk
Airfryer https://amzn.to/3E93jy0
Microplane https://amzn.to/3Asxb7p
Placa de inducción https://amzn.to/3AoMCxj
Espatula silicona pequeña https://amzn.to/3OpO3l5
Espátula silicona mediana https://amzn.to/3GDqXFT
Báscula de cocina https://amzn.to/3hP2cvM
Batidora https://amzn.to/3Vd7Lmb
Robot de cocina https://amzn.to/3GyY3GL
Pinzas de emplatar de precisión https://amzn.to/3XjAxU9
Pinzas de emplatar https://amzn.to/3gqfGOj
Pinzas para pescado https://amzn.to/3ghjWji
Sartenes antiadherentes https://amzn.to/3GxXJYJ
Micrófono de solapa https://amzn.to/3tNSug2
Trípode https://amzn.to/3gjSMZ5
Aro de luz https://amzn.to/3GyopZB
Cámara https://amzn.to/3gkMGaE
Placa de inducción https://amzn.to/3AoMCxj
Cuchillos https://amzn.to/3uizyGh
Cazos https://amzn.to/3VDPgHT
Batería de ollas https://amzn.to/3VhPHYw
Olla a presión https://amzn.to/3XO2BPU
Sartén acero inoxidable: https://amzn.to/3ugfrMG
Sauté acero inoxidable: https://amzn.to/4bkBeU8 
Sartén hierro fundido: https://amzn.to/3SntXKL
Botes de cristal: https://amzn.to/3SHqXu4
Botes de cristal herméticos 1.5L: https://amzn.to/3Sl0CQV
Botes de cristal herméticos 1L: https://amzn.to/3UjDGUX
Botecitos de cristal: https://amzn.to/3HIKOmf
Tapers de cristal: https://amzn.to/42n2FZq
Deshidratador: https://amzn.to/42ltIEy

CONECTA CONMIGO
INSTAGRAM: https://www.instagram.com/avozmechef/
TIKTOK: https://www.tiktok.com/@avozmechef?_t', 24, '/media/d14a6ed6-e892-54ae-aa08-0a513410bcb2/thumbnail.webp', '/media/d14a6ed6-e892-54ae-aa08-0a513410bcb2/video.mp4', CAST('30762215-0d1f-50e0-870b-479b29476169' AS UUID), 2340941, 98193, CAST('2024-02-15T18:00:06.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID), 'EDUCATION'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID) AND category = 'EDUCATION') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('7861a1fe-feba-5848-9a17-4587a5185966' AS UUID), CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID), NULL, 'avozmechef', 'Muchas gracias a todos por la acogida y los comentarios tan positivos!! Habrá segunda parte!! Un abrazo a todos! ♥', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 835
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('7861a1fe-feba-5848-9a17-4587a5185966' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('75e93295-e50d-5b1a-bf2b-9fcb6eb7f746' AS UUID), CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID), NULL, 'Rickshow314', 'El timing perfecto con respecto al vídeo con el tema Knoweats( que sigue siendo una opción para quién quiera), una salida a toda esa gente que busca otras opciones. Me encanta como explicas las cosas y el tono de los vídeos.', NULL, CAST('2024-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('75e93295-e50d-5b1a-bf2b-9fcb6eb7f746' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d14a6ed6-e892-54ae-aa08-0a513410bcb2' AS UUID) AND status = 'ACTIVE');

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID), '5 Cenas Listas En 15 Minutos o Menos', 'Aprende a cocinar con mi escuela online: https://www.avozmechef.es/

INGREDIENTES 2 PERSONAS:

1. TACOS
    - 300G langostinos pelados
    - 2 cucharadas pasta de chiles
    - Zumo de lima
    - Aceite
    - Sal
    - Tortillas de maiz
    - 1 aguacate
    - 1 lima
    - Cilantro
    - Cebolla roja
    - Creme fraiche
2. NOODLES
    - 200g Noodles de arroz
    - 150ml Aceite de oliva
    - 150g Crema de cacahuete
    - 1 cucharadita pimenton
    - 1 cucharadita ajo picado
    - 1 cucharadita jengibre picado
    - 1 cucharada chile seco en copos
    - 1 cucharadita aceite de sésamo
    - 1 cucharada salsa de soja
    - Zumo de lima
    - Cebolleta china
    - Cacahuetes picados
    - 2 Huevos
3. CUSCUS
    - 400g de carne picada
    - 250g de tomate triturado
    - 1 taza cuscus
    - 1 taza caldo de ave
    - Yogur griego natural
    - Ajo picado
    - Eneldo
    - Comino
    - Pepinillos encurtidos
    - Aceite de oliva
    - Sal
    - Limón
    - Queso fetta
    - Perejil picado
4. ENSALADA
    - 2 Contramuslos de pollo
    - 1 diente de ajo
    - 3 Anchoas
    - 1 Yema de huevo
    - 1 cucharadita mostaza
    - Aceite de oliva suave
    - Limón
    - Alcaparras picadas
    - Cogollos de lechuga
    - Queso parmesano rallado
5. BOCADILLO
    - 1 lomo bajo de ternera
    - 5 Pimientos del piquillo
    - Pan
    - Mantequilla
    - Queso cheddar curado
    - Queso azul

MATERIAL QUE UTILIZO O RECOMIENDO

Airfryer https://amzn.to/3E93jy0
Microplane https://amzn.to/3Asxb7p
Placa de inducción https://amzn.to/3AoMCxj
Espatula silicona pequeña https://amzn.to/3OpO3l5
Espátula silicona mediana https://amzn.to/3GDqXFT
Báscula de cocina https://amzn.to/3hP2cvM
Batidora https://amzn.to/3Vd7Lmb
Robot de cocina https://amzn.to/3GyY3GL
Pinzas de emplatar de precisión https://amzn.to/3XjAxU9
Pinzas de emplatar https://amzn.to/3gqfGOj
Pinzas para pescado https://amzn.to/3ghjWji
Sartenes antiadherentes https://amzn.to/3GxXJYJ
Micrófono de solapa https://amzn.to/3tNSug2
Trípode https://amzn.to/3gjSMZ5
Aro de luz https://amzn.to/3GyopZB
Cámara https://amzn.to/3gkMGaE
Placa de inducción https://amzn.to/3AoMCxj
Cuchillos https://amzn.to/3uizyGh
Cazos https://amzn.to/3VDPgHT
Batería de ollas https://amzn.to/3VhPHYw
Olla a presión https://amzn.to/3XO2BPU
Sartén acero inoxidable: https://amzn.to/3ugfrMG
Sauté acero inoxidable: https://amzn.to/4bkBeU8 
Sartén hierro fundido: https://amzn.to/3SntXKL
Botes de cristal: https://amzn.to/3SHqXu4
Botes de cristal herméticos 1.5L: https://amzn.to/3Sl0CQV
Botes de cristal herméticos 1L: https://amzn.to/3UjDGUX
Botecitos de cristal: https://amzn.to/3HIKOmf
Tapers de cristal: https://amzn.to/42n2FZq
Deshidratador: https://amzn.to/42ltIEy
Encendedor https://amzn.to/3Lujavk', 27, '/media/e90d131b-c7f4-5a17-9795-e8f473c07037/thumbnail.webp', '/media/e90d131b-c7f4-5a17-9795-e8f473c07037/video.mp4', CAST('30762215-0d1f-50e0-870b-479b29476169' AS UUID), 549964, 21889, CAST('2024-04-25T18:00:14.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID), 'EDUCATION'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID) AND category = 'EDUCATION') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ea991f00-a177-583b-aab7-ef6f527008a1' AS UUID), CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID), NULL, 'diegoceron5097', 'Soy mexicano y eso sí es un taco.', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ea991f00-a177-583b-aab7-ef6f527008a1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4956b5e5-2b40-5c82-a95b-2c55af166d18' AS UUID), CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID), NULL, 'lennon58117', 'Ardor de estómago garantizado ,abusas de especias,chile y soja', NULL, CAST('2026-09-18T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4956b5e5-2b40-5c82-a95b-2c55af166d18' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('455c22b6-82c2-54f8-80a2-821aaa1e529b' AS UUID), CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID), NULL, 'lucacers1', 'El ardor lo tendrás tú, hay gente que no 🤗', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('455c22b6-82c2-54f8-80a2-821aaa1e529b' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('e90d131b-c7f4-5a17-9795-e8f473c07037' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('1f09dd06-d218-5a0a-abd6-01e68f3929bd' AS UUID), 'seed-channel:1f09dd06-d218-5a0a-abd6-01e68f3929bd', '1f09dd06-d218-5a0a-abd6-01e68f3929bd@catalog.invalid', 'Pau Polo', CAST('2021-02-21T18:59:40.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2021-02-21T18:59:40.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('1f09dd06-d218-5a0a-abd6-01e68f3929bd' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID), '😂 TODO SALE MAL EN LA CITA 😂 - 🔥MEJORES MOMENTOS FIRST DATES ESPAÑA 2021🔥', '🔥En el video de hoy os traigo un NUEVO EPISODIO DE FIRST DATES! Dos citas en las que todo va mal y es bastatnte gracioso todo jajaja 🔥 
(Los videos que hago son sin ánimo de ofender, son de broma y de guasa! Que nadie los tome enserio!)

MAS EPISODIOS DE FIRST DATES: https://www.youtube.com/playlist?list​...

🔴Aqui puedes suscribirte totalmente gratis!!🤘🤘https://www.youtube.com/channel/UCi5w​...

🔰Aquí abajo os dejo mis redes sociales  gente! Seguirme, así os enterareis de cosillas y me vais conociendo!!💪💪

⭕Instagram: @paupoloyt 

⭕Snapchat: tudelano 12

⭕Twitter: https://twitter.com/polillo12?lang=es​

⭕TikTok: @paupoloyt


Contacto Gmail: paupolo1212@gmail.com

#FirstDates


























first dates españa 2021
first dates
citas 2021 
pau polo
first dates mejores momentos
first dates 2021', 21, '/media/8f74fb3f-86a2-55e0-94a6-e3d13e8e7640/thumbnail.webp', '/media/8f74fb3f-86a2-55e0-94a6-e3d13e8e7640/video.mp4', CAST('1f09dd06-d218-5a0a-abd6-01e68f3929bd' AS UUID), 59619, 2299, CAST('2021-02-21T18:59:40.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID), 'ENTERTAINMENT'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID) AND category = 'ENTERTAINMENT') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('ba18ffeb-93a3-5f13-9b4c-b96bbe2fbda8' AS UUID), CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID), NULL, 'PauPolo', 'Comentadme si quereis videos mas largos o asi de cortos!👌
🔥AQUI TENEIS MAS EPISODIOS!! 🔥
https://www.youtube.com/playlist?list...
No olvides de SUSCRIBIRTE para no perderte ningún episodio!!', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 11
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('ba18ffeb-93a3-5f13-9b4c-b96bbe2fbda8' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('bb5bd784-8ded-5df9-bd49-45921085c54e' AS UUID), CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID), NULL, 'mms6782', 'Ambos están genial pau', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('bb5bd784-8ded-5df9-bd49-45921085c54e' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('565c8bff-51c4-5842-aabd-7e7372546cb1' AS UUID), CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID), NULL, 'elishevadreams6050', 'Quita el "de" antes de suscribirte choniPau🙃🤯', NULL, CAST('2021-09-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 1
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('565c8bff-51c4-5842-aabd-7e7372546cb1' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('8f74fb3f-86a2-55e0-94a6-e3d13e8e7640' AS UUID) AND status = 'ACTIVE');

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('27c1dbad-5c34-52c6-b8f5-8c60c621b98d' AS UUID), 'seed-channel:27c1dbad-5c34-52c6-b8f5-8c60c621b98d', '27c1dbad-5c34-52c6-b8f5-8c60c621b98d@catalog.invalid', 'Marco Bucci', CAST('2017-07-07T10:01:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2017-07-07T10:01:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('27c1dbad-5c34-52c6-b8f5-8c60c621b98d' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID), 'Digital Brushwork - 10 Minutes To Better Painting - Episode 3', 'How to get interesting brushwork in your digital painting using a traditional art mindset.

🔥 My digital painting courses in ONE Bundle -  https://link.www.marcobucciartstore.com/XTEgXa
🔥 Want a complete drawing program? https://link.www.marcobucciartstore.com/N20Obr

- LINKS - 
Patreon: http://www.patreon.com/marcobucci
More Painting Lessons: http://marcobucci.myshopify.com
My website: http://www.marcobucci.com
Instagram: http://www.instagram.com/bucciblog', 21, '/media/fe8393e7-e4b1-545a-b281-c9a0ecc1e88c/thumbnail.webp', '/media/fe8393e7-e4b1-545a-b281-c9a0ecc1e88c/video.mp4', CAST('27c1dbad-5c34-52c6-b8f5-8c60c621b98d' AS UUID), 474239, 22575, CAST('2017-07-07T10:01:11.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID), 'EDUCATION'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID) AND category = 'EDUCATION') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('0c954f38-ce56-5ef6-8ae7-de4059cba304' AS UUID), CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID), NULL, 'looooo24', '6:18 say that again', NULL, CAST('2026-09-28T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('0c954f38-ce56-5ef6-8ae7-de4059cba304' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('4457e10a-6665-582f-a9cc-77e399c5b078' AS UUID), CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID), NULL, 'DreamWizard9', 'Photoshop is sh!te. Can you do a tutorial for brushwork in Procreate?', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('4457e10a-6665-582f-a9cc-77e399c5b078' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('88585880-75d8-5dff-a0b9-d6389a31220c' AS UUID), CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID), NULL, 'catnipbud', 'I have really bad memory issues that lead me to forget how to draw/paint correctly quite often. This entire series has been a life saver to revisit time and time again', NULL, CAST('2026-08-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('88585880-75d8-5dff-a0b9-d6389a31220c' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('c70cf854-c467-50b1-be6b-85da60686109' AS UUID), CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID), NULL, 'zandrexrq7526', 'best video ever', NULL, CAST('2026-07-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('c70cf854-c467-50b1-be6b-85da60686109' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('8b2475cc-5f88-561d-a1e8-ab5397f5b95d' AS UUID), CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID), NULL, 'onlineperson4701', 'While lots of other tutorials discourage artist from using too much brushes and said brushes dont matter, this video encourage more variety of brushes to increase more texture and exciting factor. For almost 8 year video, the knowledge is still relevant until this very day ❤', NULL, CAST('2026-01-30T00:00:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 0
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('8b2475cc-5f88-561d-a1e8-ab5397f5b95d' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('fe8393e7-e4b1-545a-b281-c9a0ecc1e88c' AS UUID) AND status = 'ACTIVE');
