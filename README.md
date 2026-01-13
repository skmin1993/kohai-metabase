# Kohai Metabase

Metabase analytics platform configured for deployment on Render.

## What is Metabase?

Metabase is an open-source business intelligence tool that helps you ask questions about your data and visualize the answers.

## Quick Deploy to Render

### Prerequisites
- A Render account (free tier available)
- A GitHub account

### Deployment Steps

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/your-username/kohai-metabase.git
   git push -u origin master
   ```

2. **Deploy on Render**
   - Go to [Render Dashboard](https://dashboard.render.com/)
   - Click "New +" and select "Blueprint"
   - Connect your GitHub repository
   - Render will automatically detect the `render.yaml` file
   - Click "Apply" to create both the web service and PostgreSQL database
   - Wait for deployment to complete (5-10 minutes)

3. **Access Your Metabase**
   - Once deployed, click on the web service URL
   - Complete the initial Metabase setup wizard
   - Create your admin account
   - Start analyzing your data

## Project Structure

```
kohai-metabase/
├── Dockerfile              # Docker configuration for Render
├── render.yaml            # Render deployment configuration
├── start.sh              # Startup script for Metabase
├── package.json          # Node.js project metadata
├── .env.example          # Environment variables template
├── .gitignore           # Git ignore rules
├── metabase.jar         # Metabase application (optional, will download if missing)
└── README.md            # This file
```

## Configuration

### Environment Variables

The following environment variables are automatically configured by Render:

- `MB_DB_TYPE`: Database type (postgres)
- `MB_DB_DBNAME`: Database name
- `MB_DB_HOST`: Database host
- `MB_DB_PORT`: Database port
- `MB_DB_USER`: Database username
- `MB_DB_PASS`: Database password
- `PORT`: Application port (3000)

### Custom Configuration

To customize your Metabase deployment:

1. Edit the environment variables in Render Dashboard
2. Refer to [Metabase Documentation](https://www.metabase.com/docs/latest/) for additional configuration options

## Local Development

To run Metabase locally:

```bash
# Make sure you have Java installed
java -version

# Run Metabase
java -jar metabase.jar
```

Visit `http://localhost:3000` to access Metabase.

## Database

This deployment uses PostgreSQL as the application database (free tier on Render). The H2 database files in this repository are for local development only and are not used in production.

## Render Free Tier Limitations

- Web service will spin down after 15 minutes of inactivity
- First request after spin-down may take 30-60 seconds
- 750 hours of runtime per month
- PostgreSQL database limited to 1GB storage

## Troubleshooting

### Service won't start
- Check the Render logs for errors
- Ensure PostgreSQL database is running
- Verify environment variables are set correctly

### Can't connect to database
- Verify database credentials in environment variables
- Check that database service is in the same region
- Ensure database is fully provisioned

### Slow performance
- Free tier services spin down after inactivity
- Consider upgrading to a paid plan for always-on service

## Support

For Metabase-specific questions, visit:
- [Metabase Documentation](https://www.metabase.com/docs/latest/)
- [Metabase Forum](https://discourse.metabase.com/)

For Render deployment issues:
- [Render Documentation](https://render.com/docs)
- [Render Community](https://community.render.com/)

## License

This project is licensed under the MIT License. Metabase is licensed under the [AGPL license](https://github.com/metabase/metabase/blob/master/LICENSE.txt).
