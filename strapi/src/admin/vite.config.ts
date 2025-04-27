import { mergeConfig, type UserConfig } from 'vite';

export default (config: UserConfig) => {
  // Important: always return the modified config
  return mergeConfig(config, {
    resolve: {
      alias: {
        '@': '/src',
      },
    },
    server: {
      host: true, // Listen on all addresses
      allowedHosts: [
        'strapi-alb-1413102396.us-east-1.elb.amazonaws.com',
      ],
    },
  });
};
