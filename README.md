# UAE Partner CRM – GitHub Pages package

Tento balík je určený pro přímé nahrání na GitHub Pages.

## Obsah
- index.html – kompletní CRM aplikace
- .nojekyll – vypne Jekyll build na GitHub Pages
- supabase-schema.sql – návrh databázového schématu pro pozdější Supabase fázi

## Publikace
V GitHub repository nastavte:
Settings → Pages → Build and deployment → Source: Deploy from a branch → Branch: main → Folder: /root

Po uložení bude web dostupný na adrese:
https://USERNAME.github.io/REPOSITORY-NAME/


## Aktualizace
- Přidán přepínač jazyka CZ / EN.
- CSV export používá středník `;`, aby se správně otevíral v českém Excelu.
- CSV obsahuje BOM UTF-8 kvůli diakritice v Excelu.
