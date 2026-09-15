import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// Resources are Markdown files Beth adds through the CMS (/admin) or by hand in src/content/resources/.
const resources = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/resources' }),
  schema: z.object({
    title: z.string(),
    url: z.union([z.string().url(), z.literal("")]).optional(),
    audience: z.string().default('Everyone'),
    // public = anyone; members = active cohort subscribers (link goes to the private folder);
    // purchase = sold as a product (link goes to the Stripe / Payhip page)
    access: z.enum(['public', 'members', 'purchase']).default('public'),
    order: z.number().default(50),
    published: z.boolean().default(true),
  }),
});

export const collections = { resources };
