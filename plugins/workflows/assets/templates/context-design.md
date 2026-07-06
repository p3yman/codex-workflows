---
version: alpha
name: "{project_or_product_name}"
description: "{short_visual_identity_description}"
colors:
  primary: "{primary_color_hex}"
  secondary: "{secondary_color_hex}"
  tertiary: "{accent_color_hex}"
  neutral: "{neutral_surface_color_hex}"
typography:
  headline:
    fontFamily: "{headline_font_family}"
    fontSize: "{headline_font_size}"
    fontWeight: {headline_font_weight}
    lineHeight: {headline_line_height}
  body:
    fontFamily: "{body_font_family}"
    fontSize: "{body_font_size}"
    fontWeight: {body_font_weight}
    lineHeight: {body_line_height}
  label:
    fontFamily: "{label_font_family}"
    fontSize: "{label_font_size}"
    fontWeight: {label_font_weight}
    lineHeight: {label_line_height}
rounded:
  sm: "{small_radius}"
  md: "{medium_radius}"
  lg: "{large_radius}"
spacing:
  xs: "{extra_small_spacing}"
  sm: "{small_spacing}"
  md: "{medium_spacing}"
  lg: "{large_spacing}"
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{primary_button_text_color}"
    rounded: "{rounded.md}"
    padding: "{primary_button_padding}"
---

# DESIGN.md

## Overview

Describe the product's visual identity, audience, tone, density, and the emotional response the UI should create. Keep this focused on UI and UX design guidance, not implementation architecture.

## Colors

- Primary: describe where and why the primary color is used.
- Secondary: describe secondary surfaces, borders, captions, or supporting UI.
- Tertiary: describe accent and interaction usage.
- Neutral: describe backgrounds, panels, and text surfaces.

## Typography

- Headlines: describe font, scale, weight, and usage.
- Body: describe readable body text defaults.
- Labels: describe labels, metadata, captions, and control text.

## Layout

Describe spacing, grid, density, responsive behavior, content width, navigation placement, and composition rules.

## Elevation & Depth

Describe shadows, borders, layering, overlays, focus rings, and how hierarchy is shown.

## Shapes

Describe corner radius, icon style, control shape, image treatment, and container shape rules.

## Components

- Buttons: describe variants, states, sizing, and icon usage.
- Inputs: describe labels, helper text, validation, and disabled states.
- Navigation: describe active states, grouping, and responsive behavior.
- Cards and panels: describe when framed containers are appropriate.
- Modals and popovers: describe spacing, dismissal, and hierarchy.

## Do's and Don'ts

- Do {positive_design_rule}.
- Don't {negative_design_rule}.

## Open UI/UX Questions

- {question_or_none}
- Recommended option/default: {recommended_option_or_none}
