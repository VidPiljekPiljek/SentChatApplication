using Microsoft.VisualBasic;
using Newtonsoft.Json;
using Supabase.Gotrue;
using Supabase.Gotrue.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.Services
{
    public class SupabaseSessionPersistenceService : IGotrueSessionPersistence<Session>
    {
        private readonly string _cacheFilePath;

        public SupabaseSessionPersistenceService()
        {
            var cacheDir = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);
            _cacheFilePath = Path.Join(cacheDir, ".gotrue.cache");
        }

        public void DestroySession()
        {
            try
            {
                if (File.Exists(_cacheFilePath))
                {
                    File.Delete(_cacheFilePath);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Session? LoadSession()
        {
            try
            {
                if (!File.Exists(_cacheFilePath))
                {
                    return null;
                }

                var json = File.ReadAllText(_cacheFilePath);
                return JsonConvert.DeserializeObject<Session>(json);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void SaveSession(Session session)
        {

            try
            {
                var str = JsonConvert.SerializeObject(session);

                using (StreamWriter file = new StreamWriter(_cacheFilePath))
                {
                    file.Write(str);
                    file.Dispose();
                };
            }
            catch (Exception err)
            {
                throw err;
            }
        }
    }
}
